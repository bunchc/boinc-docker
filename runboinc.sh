#!/bin/bash
set -eux
[[ "$BAM_USER" ]] || printf "You need to supply a BAM user account"
[[ "$BAM_PASS" ]] || printf "You need to supply a BAM password"

/usr/bin/boinc --daemon
until pidof -x boinc; do {
    sleep 1
} done

until /usr/bin/boinccmd --join_acct_mgr http://bam.boincstats.com "$BAM_USER" "$BAM_PASS"; do {
    echo "Trying again"
    sleep 1
}; done