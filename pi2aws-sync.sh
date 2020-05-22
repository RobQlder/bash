#! /bin/bash

# ----------------Pi2aws-sync--------------------------------------------
# Daily sync of network drive to S3 bucket at 1am via Cron
#
# May 2020 @RobQlder
# -----------------------------------------------------------------------

aws s3 sync /srv/dev-disk/insertlocation s3://insertlocation --storage-class ONEZONE_IA --sse aws:kms --sse-kms-key-id insertkey