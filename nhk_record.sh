#!/bin/bash

# Constants
VERSION=0.1.1
MPLAYER=/usr/bin/mplayer
AVCONV=/usr/bin/avconv

function show_version() {
  echo "$0 version ${VERSION}"
}

function show_usage() {
  echo "Usage:"
  echo "$0: (radio channel) (duration) [ (outfile.ext) | (output directory)]"
  echo " "
  echo "radio channel can be:"
  echo "  nhk1, nhk2, nhkfm"
  echo "  nhk1_tokyo, nhk1_osaka, nhk1_nagoya, nhk1_sendai"
  echo "  nhkfm_tokyo, nhkfm_osaka, nhkfm_nagoya, nhkfm_sendai"
  echo " "
  echo "duration in minutes: 40, 15, .."
  echo "outfile default: channel-YYYY-mm-dd-HH-MM.mp3"
  echo "ext can be: mp3, ogg, aac"
  echo "output file format is detected by extension"
  echo " "
  echo " examples:"
  echo "    $0 nhk1 15 nhk.mp3"
  echo "       record 15min from now and put nhk.mp3 on current directory."
  echo " "
  echo "    $0 nhk2 15 /srv/music/"
  echo "       record 15min from now and put /srv/music/nhk2-YY-mm-dd-HH-MM.mp3 file."
  echo " "
}

# check arguments 
if [ $# -eq 1 ]; then
  case $1 in
    -h)
      show_usage
      ;;
    -v)
      show_version
      ;;
    *)
      ;;
  esac
fi

if [ $# -lt 3 ]; then
  echo "Not enough arguments specified"
  echo " "
  show_usage
  exit 2
fi
if [ $# -gt 4 ]; then
  echo "Too many arguments specified"
  echo " "
  show_usage
  exit 2
fi

if [ ! -x ${MPLAYER} ]; then
  echo "cannot find ${MPLAYER}."
  exit 1
fi

if [ ! -x ${AVCONV} ]; then
  echo "cannot find ${AVCONV}."
  exit 1
fi

case $1 in
nhk1)
  # use Tokyo as default
  RADIO_URL=http://mfile.akamai.com/129931/live/reflector:46032.asx
  ;;
nhkfm)
  # use Tokyo as default
  RADIO_URL=http://mfile.akamai.com/129933/live/reflector:46051.asx
  ;;
nhk2)
  RADIO_URL=http://mfile.akamai.com/129932/live/reflector:46056.asx
  ;;
nhk1_tokyo)
  RADIO_URL=http://mfile.akamai.com/129931/live/reflector:46032.asx
  ;;
nhkfm_tokyo)
  RADIO_URL=http://mfile.akamai.com/129933/live/reflector:46051.asx
  ;;
nhk1_osaka)
  RADIO_URL=http://mfile.akamai.com/220635/live/reflector:53531.asx
  ;;
nhkfm_osaka)
  RADIO_URL=http://mfile.akamai.com/220636/live/reflector:50883.asx
  ;;
nhk1_nagoya)
  RADIO_URL=http://mfile.akamai.com/220637/live/reflector:52219.asx
  ;;
nhkfm_nagoya)
  RADIO_URL=http://mfile.akamai.com/220638/live/reflector:55740.asx
  ;;
nhk1_sendai)
  RADIO_URL=http://mfile.akamai.com/220639/live/reflector:59124.asx
  ;;
nhkfm_sendai)
  RADIO_URL=http://mfile.akamai.com/220640/live/reflector:52017.asx
  ;;
*)
  echo "Specified channel $1 is not supported"
  exit 3
  ;;
esac

case $2 in
[1-9]|[1-9][0-9]|[1-9][0-9][0-9])
  # from 1 to 999
  DURATION=$2m
  ;;
*)
  echo "Specified duration $2 is invalid."
  echo "should be digits. from 1 to 999."
  exit 4
  ;;
esac

if [ $# -ne 3 ]; then
  # use default outfile
  OUTFILE=$1`date +"-%Y-%m-%d-%H-%M.mp3"`
else
  if [ -d $3 ]; then
    # specified directory for third argument
    OUTFILE=$3/$1`date +"-%Y-%m-%d-%H-%M.mp3"`
  else
    # specified a filename
    OUTFILE=$3
  fi
fi

MPLAYER_OPT="-vo null -ao pcm:waveheader:fast:file=/dev/stdout -really-quiet"

(sleep ${DURATION}; echo -n q ) | ${MPLAYER} -playlist ${RADIO_URL} ${MPLAYER_OPT} | ${AVCONV} -y -i - ${OUTFILE}
