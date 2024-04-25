SOURCE_DIRECTORY=/tmp/app-logs

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
FILES=$(find $SOURCE_DIRECTORY -name "*.log")

while IFS= zip compressed_file.zip $FILES
do 
    echo "compressing files: $FILES"
    mv $FILES srinath
done <<< $FILES

