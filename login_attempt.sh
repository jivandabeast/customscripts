#!/bin/bash

webhook_url=$(cat webhook)
tail -fn0 /var/log/auth.log | \
while read line ; do
        echo "$line" | grep "authentication failure"
        if [ $? = 0 ]
        then
                fswebcam temp/test.jpg
		curl -F "file1=@temp/test.jpg" $webhook_url
        fi
done


