#!/bin/bash
set -x
[[ "$BAM_USER" ]] || printf "You need to supply a BAM user account"
[[ "$BAM_PASS" ]] || printf "You need to supply a BAM password"

function run_until() {
    OUTPUT=""
    cmd=$1
    looking_for=$2

    while [[ $(echo $OUTPUT | grep -c "$looking_for") == 0 ]]; do {
        OUTPUT=$($cmd)
        sleep 1
    } done
}

/usr/bin/boinc --daemon
until pidof -x boinc; do {
    sleep 1
} done

cmd="/usr/bin/boinccmd --join_acct_mgr http://bam.boincstats.com $BAM_USER $BAM_PASS"
run_until "${cmd}" "in progress"