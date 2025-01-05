#!/bin/bash

USR='ec2-user'
KEY="dice13.pem"

for host in `cat remhosts`
do
   echo
   echo "#########################################################"
   echo "Connecting to $host"
   echo "Pushing Script to $host"
   scp -i$KEY websetup.sh $USR@$host:/tmp/
   echo "Executing Script on $host"
   ssh -i $KEY $USR@$host sudo /tmp/websetup.sh
   ssh $USR@$host sudo rm -rf /tmp/websetup.sh
   echo "#########################################################"
   echo
done 
