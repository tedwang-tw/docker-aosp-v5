#!/bin/sh
command="repo sync"
timer=60
logfile="repo_sync.log"
OUT=1

read -p "Do you wish to start repo? [y/n]" yn
case $yn in
	[Yy]* ) break;;
	[Nn]* ) exit 0;;
	* ) echo "Please answer yes or no.";exit 1;
esac

#echo 'repo return code=' $OUT
if [ -f "$logfile" ]
then
	rm $logfile
fi

while [ "$OUT" -ne 0 ]
do
	$command
	OUT=$?

	echo 'repo return code=' $OUT
	NOW=$(date +"%Y%m%d%H%M%S")
	echo $NOW " " $OUT >> $logfile

	if [ $OUT -ne 0 ];then
		echo "\n>>>	Repo error?	Sleep for $timer seconds before retry,	or press CTRL-C to break..."
		sleep $timer
	else
		break
	fi
done

echo "\n>>>	Repo ok."
exit $OUT
