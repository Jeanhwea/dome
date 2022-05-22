ts_to_str() {
    local ts=$*
    local fmt="%Y-%m-%d %H:%M:%S"
    date -d @$ts +"$fmt" 2>/dev/null || date -r $ts +"$fmt"
}

str_to_ts() {
    local str=$*
    local fmt="%Y-%m-%d %H:%M:%S"
    date --date="$str" +"%s" 2>/dev/null || date -jf "$fmt" "$str" +"%s"
}

# ts_to_str 1650430795
# str_to_ts 2022-04-20 12:59:55
# str_to_ts 2022-06-20
# ts_to_str 1655654400
