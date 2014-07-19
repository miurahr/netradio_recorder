#!/bin/bash

# check argument numbers
if [ $# -ne 2]; then
  echo "Not enough arguments specified"
  echo "Usage:"
  echo "$0: (radio channel) (duration) [(outfile)]"
  echo " "
  echo "radio channel can be:"
  echo "  nhk1, nhk2, nhkfm"
  echo "duration in minutes: 40, 15, .."
  echo "outfile default: channel-YYYY-mm-dd-HH-MM.mp3"
  exit 2
fi

if [-x /usr/bin/mplayer]; then
  echo "cannot find mplayer."
  exit 1
fi

if [-x /usr/bin/avconv]; then
  echo "cannot find avconv."
  exit 1
fi

case $1 in
nhk1)
  RADIO_URL=http://mfile.akamai.com/129931/live/reflector:46032.asx
  ;;
nhk2)
  RADIO_URL=http://mfile.akamai.com/129932/live/reflector:46056.asx
  ;;
nhkfs)
  RADIO_URL=http://mfile.akamai.com/129933/live/reflector:46051.asx
  ;;
*)
  echo "Specified channel $1 is not supported"
  exit 3
  ;;
esac

case $2 in
[1-9]|[1-9][0-9]|[1-9][0-9][0-9])
  # from 1 to 999
  # no problem. pass it. 
  ;;
*)
  echo "Specified duration $2 is invalid."
  echo "should be digits. from 1 to 999."
  ;;
esac

if [ $# -ne 3]; then
  # use default outfile
  OUTFILE=$1`date +"-\%Y-\%m-\%d-\%H-\%M.mp3"`
else
  OUTFILE=$3
fi
MPLAYER=/usr/bin/mplayer
MPLAYER_OPT="-vo null -ao pcm:waveheader:fast:file=/dev/stdout -really-quiet"
AVCONV=/usr/bin/avconv
${MPLAYER} -playlist ${RADIO_URL} ${MPLAYER_OPT} | ${AVCONV} -y -i - ${OUTFILE}
