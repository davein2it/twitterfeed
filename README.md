# twitterfeed
Download blog RSSfeeds from google spreadsheet and tweet when a new post is published
There ares several processes



Crontab is used to automate the process 
crontab -e
Add a line for your 
*/20 * * * * cd /home/pi/documents/yourfolder && ./runrss.sh
