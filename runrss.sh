#!/bin/sh
# set feeds files back to blank for a fresh start 
rm feeds.cfg 
rm feedsnoblank.cfg
# read the Google sheets with the twitter feeds into a csv file
# duplicate the following line if more than 1 sheet being read
python gsheettf.py --noauth_local_webserver
# Write the required header row to the feeds file 
cp feedsfirstline.csv feeds.cfg
cat gsheettf.csv >> feeds.cfg
# remove any blank lines from the feeds file into feedsnoblank which will be processed
grep "[!-~]" feeds.cfg > feedsnoblank.cfg
# run rsstotwitternew which will tweet new posts
python3 ../rsstotwitternew.py