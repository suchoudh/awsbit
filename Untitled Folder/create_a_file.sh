#To create a file 
clear
while :
do 
echo -n "Please enter file name::::::"
read name
if [ -e $name ]
then 
if [ -f $name ]
then 
echo "$name file is already exists!!!!!"
fi
else
touch $name
echo "$name file is created sucessfully!!!!!!"
exit 1
fi
done
