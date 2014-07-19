netradio recorder
=================

A shell script to record nhk net radio stations

It supports NHK net radio 'radiru' stations as follows:

- NHK radio first
- NHK radio second
- NHK FM Radio

Command Usage
-------------

`nhk_record.sh (radio channel) (duration) [(outfile)]`

- radio channel can be: nhk1, nhk2, nhkfm
- duration in minutes: 40, 15, ..
- outfile default: channel-YYYY-mm-dd-HH-MM.mp3


Depenency
-------

- mplayer:  retrieve radio stream from net urls
- ffmpeg:   convert radio stream to audio(mp3) format


Platform
-------

It was tested on following OS.

- Ubuntu 14.04(LTS) (x86_64)
- Linux Mint Petra (x86_64)


Future plan
----------

- Working with forked-daapd

A Linux/FreeBSD DAAP (iTunes) media server with support
for AirPlay devices, Apple Remote (and compatibles),
Spotify and internet radio.

  https://github.com/ejurgensen/forked-daapd

- cron runner script

It parse schedule.csv file and run recorder
and generate m3u file.

- rtmpdump instead of mplayer

http://rtmpdump.mplayerhq.hu/


Reference
---------

Blogs

- http://www.senbero.com/?p=48
- http://n-sanawe.com/hm/?p=12
- http://ubuntu.futene.net/tips/radiru.html

These radios are retrieved from following URLs.

- NHK radio first:
   http://mfile.akamai.com/129931/live/reflector:46032.asx

- NHK radio second
   http://mfile.akamai.com/129932/live/reflector:46056.asx

- NHK-FM radio
   http://mfile.akamai.com/129933/live/reflector:46051.asx

