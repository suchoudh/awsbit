#To test give name is a file or directory
clear
echo -n "please enter the file or directory name::::::"
read name
if [ -e $name ]
then
if [ -f $name ]
then 
echo "$name is a file"
elif [ -d $name ]
then 
echo "$name is a directory"
fi
else
echo "$name is not a file or directory"
fi

