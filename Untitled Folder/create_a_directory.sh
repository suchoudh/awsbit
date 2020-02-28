#To create a directory 
clear
while :
do 
echo -n "Please enter directory name::::::"
read name
if [ -e $name ]
then 
if [ -d $name ]
then 
echo "$name directory is already exists!!!!!"
fi
else
mkdir  $name
echo "$name directory is created sucessfully!!!!!!"
exit 1
fi
done
