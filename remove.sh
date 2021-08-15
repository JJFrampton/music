DIR='./'
if [ -z $1 ]; then
  DIR='./*/'
else
  DIR=$1
fi
echo -e "Are you sure you want to run this action?"
echo -e "\trm ${DIR}*.opus"
echo -e "<y> <n>"
read PROCEED
if [ $PROCEED == "y" ]; then rm ${DIR}*.opus; fi
