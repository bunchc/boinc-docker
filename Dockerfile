FROM resin/rpi-raspbian:latest

ADD runboinc.sh /var/lib/boinc-client/runboinc.sh
RUN apt-get update -qq \
    && apt-get -qqy upgrade \
    && apt-get clean all \
    && apt-get install -qqy boinc \
    && chmod +x /var/lib/boinc-client/runboinc.sh

WORKDIR /var/lib/boinc-client
CMD ["./runboinc.sh"]