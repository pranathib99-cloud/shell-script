USERID=$(id -u)     #get user id of current user
R="\e[31m"  #Red
G="\e[32m" #Green
Y="\e[33m"] #Yellow
N="\e[0m"  #No Color white

LOGS_FLODER="/var/log/shell-scripts"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FLODER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FLODER"
echo "script started at : $(date)"  | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then 
    echo " ERROR:: please run this script as root privileges"
    exit 1          #failure is other then 0
fi 

VALIDATE(){                                        #Functions recevive input to /Aguments just like scripts arguments
    if [ $1 -ne 0 ]; then                          # $1 is exit status of last command
        echo "ERROR :: $2 .. $R failure $N"
        exit 1                                     #exit with failure status 
    else
        echo "installing $2 ..$G success $N"
    fi
}

# $@ - all arguments passed to script
for package in $@
do
    #check if package is installed or not
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOGS_FILE  
        VALIDATE $? "$package" 
    else
        echo -e "$package is already exit ... $Y skipping $N"  
    fi
done

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-09c813fb71547fc4f",
            "InstanceId": "i-0579a01df7bc048fb",
            "InstanceType": "t3.micro",
            "LaunchTime": "2025-10-07T17:02:04+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-16-210.ec2.internal",
            "PrivateIpAddress": "172.31.16.210",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0529e01bf9476f5d2",
            "VpcId": "vpc-049fcc5ef9fb608bf",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "16408106-60a9-4cd7-a259-b48643297c26",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2025-10-07T17:02:04+00:00",
                        "AttachmentId": "eni-attach-09deefa7c22a80d1a",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "launch-wizard-1",
                            "GroupId": "sg-0b5711d20e4247352"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:ff:f3:0f:a8:89",
                    "NetworkInterfaceId": "eni-0bd158724a480521b",
                    "OwnerId": "016491065349",
                    "PrivateDnsName": "ip-172-31-16-210.ec2.internal",
                    "PrivateIpAddress": "172.31.16.210",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-16-210.ec2.internal",
                            "PrivateIpAddress": "172.31.16.210"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0529e01bf9476f5d2",
                    "VpcId": "vpc-049fcc5ef9fb608bf",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "launch-wizard-1",
                    "GroupId": "sg-0b5711d20e4247352"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "test"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 2
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "uefi"
        }
    ],
    "OwnerId": "016491065349",
    "ReservationId": "r-0f21de0ff94c991e7"
}

aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-0b5711d20e4247352 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test1}]' --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text


aws ec2 run-instances --image-id i-0ea84e61fb942f065 --instance-type t3.micro --security-group-ids sg-0b5711d20e4247352 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test1}]' --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text
