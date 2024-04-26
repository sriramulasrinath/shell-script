MEMORY_USAGE=$(free -mt | grep Total:)
MEMORY_THRESHOLD=100
MESSAGE=""
while IFT= read -r line 
do
    USAGE=$(echo $line | awk '{print $4}')
    if [ $USAGE -ge $MEMORY_THRESHOLD ]
    then
        MESSAGE+="current usage: $USAGE is more then $MEMORY_THRESHOLD"
    else
        MESSAGE+="current usage: $USAGE is less then $MEMORY_THRESHOLD"
    fi 
done <<< $MEMORY_USAGE

echo "$MESSAGE" | mail -s "Memory Usage alert" sriramulasrinath59@gmail.com