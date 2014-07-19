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

- Ubuntu 14.04(LTS) (x86-64)
- Linux Mint Petra (x86-64)


Legal notice
----------

WARNING

Radio programs are protected by copyright law.
Please refer a documents follows:

  http://www3.nhk.or.jp/toppage/nhk_info/copyright.html

  http://www3.nhk.or.jp/netradio/faq.html


This script is released under GPL-3 license.
Details are shown on COPYING file.

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


International Podcast from NHK

You can listen international radio program online at

http://www3.nhk.or.jp/nhkworld/english/radio/program/
