# twitterfeed
Download blog RSSfeeds from google spreadsheet and tweet when a new post is published
There are several processes
What this relies on is a google spreadsheet with blog addresses you wish to monitor for tweeting

Example Spreadsheet



#Bash Script 
The bash script runrss.sh is to perform afe

#!/bin/sh
# Remove the feeds files that were processed last time 
rm feeds.cfg
rm feedsnoblank.cfg
# Download the current data from a google spreadsheet(s) holding the feeds
python feedspread1tf.py --noauth_local_webserver
python feedspread2tf.py --noauth_local_webserver
# Copy the header row needed by the Twython Programme
cat feedsfirstline.csv >> feeds.cfg
# add the records downloaded from the spreadsheets to the combined feeds config
cat feedspread1tf.csv >> feeds.cfg
cat feedspread2tf.csv >> feeds.cfg
# Remove any blank lines from the feeds to form a file with no blanks
grep "[!-~]" feeds.cfg > feedsnoblank.cfg
# Process the 
python3 ./rsstotwitternew.py






Crontab is used to automate the process 
crontab -e
Add a line for your 
*/20 * * * * cd /home/pi/documents/yourfolder && ./runrss.sh
