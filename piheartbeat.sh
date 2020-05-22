#! /bin/bash

# ----------------PiHeartbeat--------------------------------------------
# Daily Pi temp check and SMS notification to validate alerting config
# 11am cron job
#
# May 2020 @RobQlder
# -----------------------------------------------------------------------

# get the temp
result=`/opt/vc/bin/vcgencmd measure_temp`
#echo $result

# extract the floating point number from vcgencmd response
num=$(echo $result | grep -Eo '[0-9]+([.][0-9]+)?')

# send heartbeat message
logger "PiHeartbeat temp: $num'C"
aws sqs send-message --queue-url https://insertSQSqueue --message-body "INFO - Pi HEARTBEAT TEMP: $num'C"