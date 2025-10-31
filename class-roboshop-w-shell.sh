manuall process  ***************************************************17s
ami > sg > keypair > ec2 instance > ec2 type > storage 

command line process
authontication before 
===============================================
aws create instance
 key=""
 sg=""
instance type="" 


approching types
aws command line
Teraform
java
python java script
programming                
#aws configure - aws iam > user creat > adminitration permisons > access key > secret key
command line ># aws configure
access key
secret key
region -
===============================================
creating instance
update private ip in r53 records 
in froent update public ip in r53 records as zyna

aws ec2 run-instances \
    --image-id 
    --instance-type t2.micro \
    --security-group-ids 
    tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=roboshop-web}]' \

instance id
    aws ec2 run-instances \
      --image-id ami-0abcdef1234567890 \
      --instance-type t2.micro \
      --key-name MyKeyPair \
      --security-group-ids sg-0123456789abcdef0 \
      --count 1 \
      --query 'Instances[0].InstanceId' \
      --output text

    based on instance id we can do further process private ip


#so now we are creating instance using above command in shell script
#in shell script we are using variables to make it dynamic

    