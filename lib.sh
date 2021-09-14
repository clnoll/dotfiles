gprof2dot-and-go () {
    local file=$(mktemp).svg
    gprof2dot --format pstats $1 | dot -T svg -o $file
    echo $file
    open -a "/Applications/Google Chrome.app" $file
}
