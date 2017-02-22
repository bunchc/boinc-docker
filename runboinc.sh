#!/bin/bash -
#set -eux

: "${BAM_USER:?You need to supply a BAM user account}"
: "${BAM_PASS:?You need to supply a BAM password}"

/usr/bin/boinc --daemon
sleep 10
/usr/bin/boinccmd --join_acct_mgr http://bam.boincstats.com "$BAM_USER $BAM_PASS"