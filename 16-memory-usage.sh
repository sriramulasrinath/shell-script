MEMORY_USAGE=$free -mt 
MEMORY_THRESHOLD=
MESSAGE=""
while IFT= read -r line 
do
    USAGE= echo $line | grep Total: | awk '{print $4}'
    if [ $USAGE -ge $MEMORY_THRESHOLD ]
    then
        MESSAGE+= "current usage: $USAGE is more then $MEMORY_THRESHOLD"
    else
        MESSAGE+= "current usage: $USAGE is less then $MEMORY_THRESHOLD"
    fi 
done >>> $MEMORY_USAGE

echo "$MESSAGE" | mail -s "Disc Usage alert" sriramulasrinath59@gmail.com