import sys
import re
from inflection import camelize

table_name = ''
table_comment = ''
columns = []

template = '''
import (
    "time"
)

type {class_name} struct {{
{fields}
}}

// {table_comment}
func ({first_letter} *{class_name}) TableName() string {{
    return "{table_name}"
}}
'''


def parse_column(line):
    match = re.match(
        r"^.*`(?P<column>\w+)` (?P<desc>.*) COMMENT '(?P<comment>.+)'.*$",
        line, re.I)
    if match:
        columns.append(match.groupdict())


def parse_table(line):
    global table_name
    if table_name != '':
        return
    match = re.match(r"^.*CREATE TABLE `(?P<table>\w+)`.*$", line, re.I)
    if match:
        table_name = match.group("table")


def parse_table_comment(line):
    global table_comment
    if table_comment != '':
        return
    match = re.match(r"^.*COMMENT *= *'(?P<comment>.+)'.*$", line, re.I)
    if match:
        table_comment = match.group("comment")


def parse():
    for line in sys.stdin:
        parse_table(line)
        parse_table_comment(line)
        parse_column(line)


def make_field(info):
    lines = []
    for col in columns:
        desc = col['desc']
        column = col['column']
        comment = col['comment']
        type = "string"
        if 'bigint' in desc:
            type = 'int64'
        elif 'int' in desc:
            type = 'int64'
        elif 'timestamp' in desc:
            type = 'time.Time'
        line = '\t{field} {type} `gorm:"column:{column}" json:"{column}"` // {comment}'.format(
            field=camelize(column), column=column, type=type, comment=comment)
        lines.append(line)
    return "\n".join(lines)


def format_class(placeholder):
    print(template.format(**placeholder))


def main():
    parse()
    format_class({
        "first_letter": table_name[0],
        "class_name": camelize(table_name),
        "table_name": table_name,
        "table_comment": table_comment,
        "fields": make_field(columns),
    })


if __name__ == '__main__':
    main()
