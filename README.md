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

Reference
---------

These radios are retrieved from following URLs.

- NHK radio first:
   http://mfile.akamai.com/129931/live/reflector:46032.asx

- NHK radio second
   http://mfile.akamai.com/129932/live/reflector:46056.asx

- NHK-FM radio
   http://mfile.akamai.com/129933/live/reflector:46051.asx

