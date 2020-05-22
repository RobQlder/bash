#! /bin/bash

# ----------------PiTemp-------------------------------------------------
# Check Pi running temp is within a healthy range
# run as cron job every 30 minutes and send an SMS for WARN & CRITICAL events
#
# May 2020 @RobQlder
# -----------------------------------------------------------------------

# get the temp
result=`/opt/vc/bin/vcgencmd measure_temp`
#echo $result

# extract the floating point number from vcgencmd response
num=$(echo $result | grep -Eo '[0-9]+([.][0-9]+)?')

# check which range the temp falls into. Sent alert via AWS for high temp and overheating events
if (( $(bc <<< "$num < 70") )); then
#  echo "TEMP NORMAL: $num'C";
  logger "PiTemp NORMAL: $num'C"
#  aws sqs send-message --queue-url https://insertSQSqueue --message-body "INFO - Pi HEARTBEAT NORMAL: $num'C"
elif (( $(bc <<< "$num < 80") )); then
#  echo "WARNING Pi RUNNING HOT: $num'C"
  logger "PiTemp WARNING: $num'C"
  aws sqs send-message --queue-url https://insertSQSqueue --message-body "WARNING - Pi RUNNING HOT: $num'C"
else
#  echo "CRITICAL Pi TEMP ALERT: $num'C"
  logger "PiTemp CRITICAL: $num'C"
  aws sqs send-message --queue-url https://insertSQSqueue --message-body "CRITICAL - Pi OVERHEATING: $num'C"
fi
