#!/bin/bash

set -eux

cd $(dirname $(dirname $(readlink -f $0)))

snapcraft snap --output subiquity_test.snap
urlbase=http://cdimage.ubuntu.com/ubuntu-server/daily-live/current
isoname=$(distro-info -d)-live-$(dpkg --print-architecture).iso
zsync ${urlbase}/${isoname}.zsync
sudo ./scripts/inject-subiquity-snap.sh ${isoname} subiquity_test.snap custom.iso

