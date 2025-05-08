#!/bin/bash

# Gmail account credentials
username="your_mail@gmail.com"
password="16 character password" #your app password will be separated every 4th character like AAAA BBBB CCCC DDDD, be sure to delete the blanks to get AAAABBBBCCCCDDDD
offset="                                        "  # Adjust the number of spaces for desired offset

# Fetch Gmail feed and parse titles of the most recent emails, default is 7, change it if you want. 
curl -s -u "$username:$password" https://mail.google.com/mail/feed/atom/important | \ #delete "important" if you want every single email, unfiltered by importance, beware that non-important emails tend to be longer so you'll probably have to change head value
grep -o "<title>[^<]*" | \
grep -v "Gmail - Label &#39;important&#39; for $username" | \ 
sed 's/<[^0-9]*>//g' | \
head -n 7 | \
fold -s -w 50 | \
sed "s/^/${offset}/"  # Add spaces at the start of each line

