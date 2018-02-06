# twitterfeed does the following
Download blog RSSfeeds from google spreadsheet and tweet when a new post is published
What this relies on is a google spreadsheet with rss feed addresses you wish to monitor for tweeting. 

# This blog outlines the basics of downlaoding the google sheet via a python script. Acknowledgements
Joel Hamilton - who got this working for a group of schools in New Zealand 
http://wescpy.blogspot.co.nz/2016/07/exporting-google-sheet--as-csv.html
you call the spreadheet through the googleio.py script 

# This blog goes through the basics of using 
http://samplefive.com/2016/06/send-your-rss-feeds-to-twitter/



# Bash Script 
The bash script runrss.sh is to perform the steps 

#!/bin/sh
#Remove the feeds files that were processed last time 
rm feeds.cfg
rm feedsnoblank.cfg
#Download the current data from a google spreadsheet(s) holding the feeds
python feedspread1tf.py --noauth_local_webserver
python feedspread2tf.py --noauth_local_webserver
#Copy the header row needed by the Twython Programme
cat feedsfirstline.csv >> feeds.cfg
#dd the records downloaded from the spreadsheets to the combined feeds config
cat feedspread1tf.csv >> feeds.cfg
cat feedspread2tf.csv >> feeds.cfg
#Remove any blank lines from the feeds to form a file with no blanks
grep "[!-~]" feeds.cfg > feedsnoblank.cfg
#Process the 
python3 ./rsstotwitternew.py


# Crontab is used to automate the process 
crontab -e
Add a line for your 
*/20 * * * * cd /home/pi/documents/yourfolder && ./runrss.sh
