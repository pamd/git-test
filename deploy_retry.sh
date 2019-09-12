#!/bin/bash
#
# This script will be triggered when "master" branch is updated.
# It copies "submitted_data" and "processed_data" to permanent locations in S3
# buckets, cleans up everything in "submitted/" sub-directory and commits the
# changes back to remote repo.

set -e -x

PR_NUMBER=76

# Find submitted files in the PR
GH_PR_API="https://api.github.com/repos/greenelab/cimr-d/pulls/${PR_NUMBER}/files"
SUBMITTED_FILES=$(curl -s ${GH_PR_API} | jq -r '.[].filename' | grep "^submitted/") || true
if [ -z "${SUBMITTED_FILES}" ]; then
    exit 0
fi

PR_STR="PR-${PR_NUMBER}"

# awscli commands ...

function git_commit() {
    # Move submitted files in the PR to "processed/"
    mkdir -p processed/${PR_STR}/
    for f in ${SUBMITTED_FILES}; do
	git mv $f processed/${PR_STR}/
    done

    # Update "processed/README.md", which lists all files in "cimr-d" S3 bucket
    aws s3 ls cimr-d --recursive --human-readable > processed/s3_list.txt
    python3 .circleci/txt2md.py
    git add processed/README.md

    # Update "catalog.txt"
    awk -F'\t' '{ if (NR > 1) print $0 }' PR_catalog.txt >> catalog.txt
    git add catalog.txt

    # Commit changes and push them to remote "master" branch
    git commit -m "CircleCI: Save processed request ${PR_STR} [skip ci]"
}

# dhu test code only
if [ ! -e submitted/*.yml ] && [ ! -e submitted/*.yaml ]; then
    ./recover_submitted.sh
fi

# Try "git push" commands at most 5 times, with random interval between 0 and 90 seconds
#
# Ref: https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
#
RANDOM=$$  # set random seed to current process ID
for i in $(seq 5); do
    # Pull latest changes from remote repo to local repo
    git pull

    # Commit all changes to local repo
    git_commit

    # dhu wait:
    date; sleep 30; echo "Starting git push ..."

    # Try to push changes from local repo to remote repo
    echo "$(date): git push attempt #$i"
    GH_UPDATED=true
    git push || GH_UPDATED=false

    # If "git push" succeeds, get out of "for" loop
    if [ $GH_UPDATED == true ]; then
	break
    fi

    # If "git push" fails, reset the commit
    git reset --hard HEAD~1

    # Sleep for a random number of seconds between 0 and 90 seconds
    RAND10=$((RANDOM % 10))
    echo "`date`: random is $RAND10"
    sleep $((RAND10 * 10))
    echo "`date`: wake up"
done
