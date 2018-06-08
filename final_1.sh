#first script

#!/bin/sh

chmod 700 second.sh
chmod 700 final.sh

scp -i /home/sagar/shellscripting1.pem /home/sagar/final_1.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:
scp -i /home/sagar/shellscripting1.pem /home/sagar/second.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:
scp -i /home/sagar/shellscripting1.pem /home/sagar/final.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:

ssh -i /home/sagar/shellscripting1.pem ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com ./second.sh

#second script file

#!/bin/sh


mkdir sagar
mv second.sh /home/ec2-user/sagar
mv final.sh /home/ec2-user/sagar
mv final_1.sh /home/ec2-user/sagar
cd sagar


abc=$(aws --output text --query "Reservations[*].Instances[*].PrivateIpAddress" ec2 describe-instances --instance-ids `aws --output text --query "AutoScalingGroups[0].Instances[*].InstanceId" autoscaling describe-auto-scaling-groups --auto-scaling-group-names "shellscripting"`)


scp /home/ec2-user/sagar/final.sh ec2-user@$abc:
scp /home/ec2-user/sagar/final_1.sh ec2-user@$abc:


ssh -t -t ec2-user@$abc ./final.sh


#final script

#!/bin/sh

mkdir sagar
mv final.sh /home/ec2-user/sagar
mv final_1.sh /home/ec2-user/sagar
cd sagar

sudo yum update
sudo yum install git

git init
git add final_1.sh
git commit -m "first commit of the assignment"
git remote add origin https://github.com/sagarquantiphi/script.git
git push -u origin master

echo "git job done"
