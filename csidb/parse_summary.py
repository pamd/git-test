#!/usr/bin/env python3

# This script reads "csidb_summary.md" and prints out columns and tables
# that include them.

def parse(filename):
    col2table = dict()

    with open(filename) as fh:
        for line in fh:
            line = line.strip()
            if "-->" in line:
                table_name = line.split("-->")[1].strip().strip("*")
                continue
            if "|" in line:
                tokens = line.split("|")
                tok0 = tokens[0].strip()
                tok1 = tokens[1].strip()
                if tok0 == "Field" and tok1 == "Type":
                    continue
                if tok0.startswith("----"):
                    continue
                col_name = tok0
                col_type = tok1
                if col_name not in col2table:
                    col2table[col_name] = list()
                col2table[col_name].append(
                    {'table': table_name, 'type': col_type}
                )

    return col2table


if __name__ == '__main__':
    filename = 'csidb_summary.md'
    col2table = parse(filename)
    keys = sorted(col2table.keys())
    print("# of unique column names:", len(keys))
    col_counter = 0
    for k in keys:
        value = col2table[k]
        col_counter += len(value)
        if len(value) == 1:
            #print(k, value[0])
            pass
        else:
            print(k)
            for idx, v in enumerate(value, start=1):
                print(f"  ({idx})", v, sep="\t")
            print()

    #print("Total # of columns:", col_counter)

# 276 columns, 179 of them are unique.
