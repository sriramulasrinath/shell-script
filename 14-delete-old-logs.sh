SOURCE_DIRECTORY=/tmp/app-logs
DESTINATION_DIRECTORY=/tmp/app-logs/srinath

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
#d means specified directory exist or not
then    
    echo -e "$G Source directory exists $N"
else    
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
fi
FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

#while IFS= read -r line
#do 
#    echo "Deleting file: $line"
#    rm -rf $line
#done <<< $FILES



# Iterate over each file in $FILES
while IFS= read -r file; do
    echo "Compressing file: $file"
    zip compressed_files.zip "$file"
    zip -r $file $DESTINATION_DIRECTORY
done <<< "$FILES"

