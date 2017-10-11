
######################################################################
# dhu customization
######################################################################
alias cls=clear
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

umask 0022

# dos2unix
if [ -f /usr/bin/fromdos ]; then
    alias dos2unix=fromdos
fi

if [ -f /usr/bin/todos ]; then
    alias unix2dos=todos
fi

# Variables defined for mysql
export EDITOR=/usr/bin/emacs

# Compiler related configuration:
# CFLAGS controls C compiler (cc) option:
export CFLAGS='-g -Wall'

# CPPFLAGS sets the preprocessor options. It is NOT C++ flags.
# so this variable will be used by both C and C++ compilers.

# CXXFLAGS controls C++ compile options.
export CXXFLAGS='-g -Wall -std=c++0x'

# Python startup. dhu: DO NOT use ~ in the path.
export PYTHONSTARTUP='/home/dhu/.pythonrc'

# Run python statement(s) on shell command line:
# https://stackoverflow.com/questions/2043453/executing-python-multi-line-statements-in-the-one-line-command-line
#    $ python -c "print(123*456)"
# or:
#    $ echo "print 123*456" | python
#
# Alternatively, we can use "expr", "bc" (Basic Calculator) or "awk" command.
# Ref: https://www.shell-tips.com/2010/06/14/performing-math-calculation-in-bash/
# (1) "expr" can be used only for integers. This is a great limitation.
#       $ 1 + 2 | expr
# (2) "bc" is very powerful. By default it only keeps two digits after decimal point,
#      but "bc -l" enables maximum scaling:
#       $ echo "12.3*4.56 | bc -l
#     We can also set customized scale for "bc":
#       $ echo "scale=3; 12.3*4.56" | bc
# (3) "awk" example:
#       $ awk "BEGIN {print 100/3}"
#

# Launch ediff in emacs
# Ref #1: function definition
# https://defunitive.wordpress.com/2011/07/23/invoking-emacs-ediff-from-the-command-line/
# Ref #2: maximized window (do NOT use "-fs", which is "full screen".)
# http://www.emacswiki.org/emacs/EdiffMode
function ediff() {
    if [ "X${2}" = "X" ]; then
	echo "USAGE: ediff <FILE 1> <FILE 2>"
    else
	# The --eval flag takes lisp code and evaluates it with emacs
	emacs -mm --eval "(ediff-files \"$1\" \"$2\")"
    fi
}

# Log out Ubuntu desktop's gnome session with command line
# http://askubuntu.com/questions/15795/how-can-you-log-out-via-the-terminal
alias dhu_logout='gnome-session-quit --logout --no-prompt'

# Disable bash autocomletion of a certain command
# http://unix.stackexchange.com/questions/96534/disable-bash-autocompletion-for-a-specific-command-only
# Example: disable autocompletion of "make" command completely
#complete -W "" make
#
# Only allow "make" to auto-complete regular files in current directroy
# http://www.thegeekstuff.com/2013/12/bash-completion-complete/
#complete -f make
# or:
#complete -o default make
# Note: DO NOT use "-o bashdefault"
#
# Use system default, then add file names in current
# directory into the auto-completion list of "make".
# https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
if [ -f /usr/share/bash-completion/completions/make ]; then
    source /usr/share/bash-completion/completions/make
    complete -F _make -f make
fi


# Use Ctrl + Alt + Backspace to restart X.
# It will be even better if this command is set to automatic startup program, because
# then it will be effective right after login (instead of after a bash interactive shell).
# Putting this line in /etc/rc.local does NOT enable it system-wide, WHY?
setxkbmap -option terminate:ctrl_alt_bksp

# Add ~/.local/bin into PATH.
# This is the default path of executable files for dhu "pip install" command.
# For example, "yolk" is installed by: "pip install yolk"
# "yolk -V django" will show all available django package version in PyPI.
export PATH=~/.local/bin:$PATH

# Print the name(s) of files that has "foobar":
#   grep -l "foobar" *.txt
# Count the number of matches of "foobar" in all txt files:
#   grep -c "foobar" *.txt

# Synchronize my git fork to the master:
# $ git remote add upstream https://github.com/<master_repo>.git (only once)
# $ git remote -v # Confirm (optional)
#
# Rebase (use this procedure to update dhu's local and remote repos to greenelab master
# $ git fetch upstream
# $ git checkout master  # optional
# $ git merge upstream/master
# $ git push

# Clone a non-master branch on git:
# http://stackoverflow.com/questions/20033863/pull-specific-branch-from-git
# $ git clone https://github.com/mhuyck/adage-server.git -b <branch_name> --single-branch

# Add all tracked files in git:
# https://stackoverflow.com/questions/572549/difference-between-git-add-a-and-git-add
# (1) Stages all files (including untracked (new) files and deleted):
#       git add -A
# (2) Stages new files and modified ones, WITHOUT deleted files
#       git add .
# (3) stages modified and deleted, WITHOUT new files (used most often probably)
#       git add -u

# Merge pdf files:
# http://stackoverflow.com/questions/2507766/merge-convert-multiple-pdf-files-into-one-pdf
# (1) "gs" command with generic options:
#   $ gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf input1.pdf input2.pdf
#
# (2) "gs" with "-dPDFSETTINGS=/prepress" for higher resolution (recommended)
#   $ gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf input1.pdf input2.pdf
#
# (3) "pdftk" (pdf toolkit) command (recommended, but need to install pdftk package):
#   $ pdftk input1.pdf input2.pdf cat output merged.pdf
#
# (4) "pdfunite" command (output file may be too large, may break hyperlinks, merged PDF file
#     may crash when more annotations were added to it by Adobe Reader App in iPad):
#   $ pdfunite input1.pdf input2.pdf merged.pdf
#
# (5) "pdfjoin" command (may break hyperlinks, may fail when input file has too many pages):
#   $ pdfjoin input1.pdf input2.pdf       # output file: input2-joined.pdf
#
# (6) "convert" command (NOT recommended: output resolution is bad):
#   $ convert input1.pdf inpu2.pdf merged.pdf
#
# pip: only upgrade a certain package, WITHOUT upgrading the dependencies:
#   $ pip install -U --no-deps django-genes

# Alias to start the simple python http server:
alias py_http_server='python -m SimpleHTTPServer'

# Run a certain unit test case in tests.py:
# $ ./manage.py test analyaze.tests.APIResourceTestCase.test_sample_get

# Location of MOTD (message of the day) on Ubuntu 16.04:
# /run/motd.dynamic
alias motd='cat /run/motd.dynamic'

# Image Viewer in Gnome: eog (Eye of Gnome)

# pandoc: Convert txt into epub (installed by "apt-get install pandoc"
# http://ebooks.stackexchange.com/questions/1249/converting-raw-text-to-epub
# Command: pandoc input.txt -o output.epub

# Path of "Trash" folder on the desktop: ~/.local/share/Trash/files
# These two sub-directories:
#    ~/.local/share/Trash/expunged/: not useful.
#    ~/.local/share/Trash/info/: bookkeeping info for file restore.

# Create a bootable USB stick on Ubuntu:
# (1) GUI:
#     https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu
# (2) Command line (dd):
#     https://askubuntu.com/questions/372607/how-to-create-a-bootable-ubuntu-usb-flash-drive-from-terminal

# "sort -k3 -g filename":
# sort a file by its 3rd field in general numerical format (including floating point).
# With "-n" option, "9.2e-5" will be LARGER than "0.12", which is wrong!
