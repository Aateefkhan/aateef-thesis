#!/bin/bash 
execute=$1 
count1=1
total=100
docker_name=$(docker ps | grep functions/figlet:0.13.0 | awk '{print $11}')
while [  $count1 -lt $total ]; do
	echo The count is $count1 #>> /dev/null
	input=$(cat sample)
	docker exec -it $docker_name figlet $input #>> /dev/null
	count1=`expr $count1 + 1`
done
con_cpu=$(cat metrics2.txt | awk '{printf $1}')
con_mem=$(cat metrics2.txt | awk '{printf $2}')
con_disk=$(cat metrics2.txt | awk '{printf $3}')
echo " "
echo "---------------------------DYNAMIC SCALING-------------------------"
echo " "
echo "CPU used by figlet container:                 $con_cpu %"
echo " "
echo "Memory used by figlet container:              $con_mem MB"
echo " "
echo "Block I/O used by figlet container:           $con_disk MB"
python controller.py $con_cpu $con_mem $con_disk $docker_name
