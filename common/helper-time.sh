ts_to_str() {
    local ts=$*
    date -d @$ts +"%Y-%m-%d %H:%M:%S"
}

# ts_to_str 1650430795
