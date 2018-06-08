#!/bin/sh


aws ec2 run-instances --image-id ami-14c5486b --count 1 --instance-type t2.micro --key-name shellscripting --security-group-ids sg-1b607b53 --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=sagar1},{Key=username,Value=sagar.yadav},{Key=email,Value=sagar.yadav@quantiphi.com}, {Key=project,Value=PE_Trainig}]' --iam-instance-profile Name=PE_trainee_Admin_role --user-data  '#!/bin/bash
echo "This file will be uploaded to ec2instance">upstream.txt
aws s3 cp upstream.txt s3://sagar111/upstream.txt'




aws s3 ls s3://sagar111/upstream.txt
while [ $? -ne 0 ]
do
    aws s3 ls s3://sagar111/upstream.txt
    if [[ $? -eq 0 ]]
    then
        break
    fi
done



aws ec2 run-instances --image-id ami-14c5486b --count 1 --instance-type t2.micro --key-name shellscripting --security-group-ids sg-1b607b53 --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=sagar2},{Key=username,Value=sagar.yadav},{Key=email,Value=sagar.yadav@quantiphi.com}, {Key=project,Value=PE_Trainig}]' --iam-instance-profile Name=PE_trainee_Admin_role --user-data '#!/bin/bash
aws s3 cp s3://sagar111/upstream.txt downstream.txt'


