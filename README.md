# twitterfeed
Download blog RSSfeeds from google spreadsheet and tweet when a new post is published
There are several processes
What this relies on is a google spreadsheet with blog addresses you wish to monitor for tweeting

Example Spreadsheet






Crontab is used to automate the process 
crontab -e
Add a line for your 
*/20 * * * * cd /home/pi/documents/yourfolder && ./runrss.sh
