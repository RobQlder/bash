# bash
Some basic scripts to perform small tasks.  All these run on a raspberry pi currently with AWS CLI installed.

pi2aws-sync: syncs a local share to aws s3 bucket using customer configured encryption key.
piheartbeat: gets the raspberry pi temp. Writes to syslog and sends to AWS SQS.
pitemp: gets the temp of the raspberry pi, writes to syslog and sends alerts based on high temp triggers to AWS SQS.

note: I am experimenting with SQS (queues) and have SNS monitoring my queue for events to send. You can just as easily have these scripts write direct to SNS.
