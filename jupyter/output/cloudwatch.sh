#!/bin/bash
cpu=$(cat cpu_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
mem=$(cat mem_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
disk=$(cat disk_pred_output | sed 's/[][]//g' | awk '{printf "%.0f\n", $1}')
aws cloudwatch put-metric-data --metric-name CPU_Prediction --namespace arima_prediction --unit Percent --value $cpu --dimensions InstanceId=i-00278136b1551baee,InstanceType=t2.large --region eu-west-1
aws cloudwatch put-metric-data --metric-name Memory_Prediction --namespace arima_prediction --unit Percent --value $mem --dimensions InstanceId=i-00278136b1551baee,InstanceType=t2.large --region eu-west-1
aws cloudwatch put-metric-data --metric-name Disk_Prediction --namespace arima_prediction --unit Gigabytes --value $disk --dimensions InstanceId=i-00278136b1551baee,InstanceType=t2.large --region eu-west-1
