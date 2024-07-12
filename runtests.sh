#!/bin/bash

set -eu -o pipefail

run_test() {
    local cmd_elements=$#
    local cmd_name=${!cmd_elements}
    echo "#################"
    echo $cmd_name
    echo "#################"
    /usr/bin/time -p "$@"

}

source .venv/bin/activate

run_test ./stats
run_test ./stats_mmap
run_test python3 stats.py
run_test python3 stats_mmap.py
