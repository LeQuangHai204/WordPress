#!/bin/bash

sudo dnf install -y git
cd /tmp/
git clone https://github.com/LeQuangHai204/WordPress.git
cd WordPress/

aws deploy delete-application --application-name WordPress_App
aws deploy create-application --application-name WordPress_App
aws s3 rm s3://cos40006-code-deploy-bucket/WordPressApp.zip

aws deploy push \
  --application-name WordPress_App --s3-location s3://cos40006-code-deploy-bucket/WordPressApp.zip --ignore-hidden-files
aws deploy create-deployment-group \
  --application-name WordPress_App \
  --deployment-group-name WordPress_DepGroup \
  --deployment-config-name CodeDeployDefault.OneAtATime \
  --ec2-tag-filters Key=Name,Value=CodeDeployDemo,Type=KEY_AND_VALUE \
  --service-role-arn arn:aws:iam::995692339962:role/CodeDeployServiceRole
aws ssm create-association \
  --name AWS-ConfigureAWSPackage \
  --targets Key=tag:Name,Values=CodeDeployDemo \
  --parameters action=Install,name=AWSCodeDeployAgent \
  --schedule-expression "cron(0 2 ? * SUN *)" 
aws deploy create-deployment \
  --application-name WordPress_App \
  --deployment-config-name CodeDeployDefault.OneAtATime \
  --deployment-group-name WordPress_DepGroup \
  --s3-location bucket=cos40006-code-deploy-bucket,bundleType=zip,key=WordPressApp.zip

  aws ec2 create-launch-template \
    --launch-template-name CodeDeploy-LaunchTemplate \
    --version-description "Version 1" \
    --launch-template-data '{
        "ImageId": "ami-0abcdef1234567890",
        "InstanceType": "t2.micro",
        "KeyName": "hailq-ssh-key",
        "SecurityGroupIds": ["sg-02cd7f8f9f46a5c3c"],
        "UserData": "IyEvYmluL2Jhc2gKc3VkbyBkbmYgaW5zdGFsbCAtWSBlcGVsLXJlbGVhc2UKc3VkbyBkbmYgaW5zdGFsbCAtWSBzdHJlc3MKc3RyZXNzIC0tY3B1IDQgLS10aW1lb3V0IDMwMA==",
        "TagSpecifications": [{
            "ResourceType": "instance",
            "Tags": [{
                "Key": "Name",
                "Value": "CodeDeployDemo"
            }]
        }]
    }'

aws ec2 run-instances \
    --launch-template LaunchTemplateName=CodeDeploy-LaunchTemplate,Version=1

aws elb create-load-balancer \
    --load-balancer-name CodeDeploy-AELB \
    --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" \
    --subnets subnet-0d0d135a41406a18e subnet-025975f8ff5fda79e \
    --security-groups sg-0fdd436de6b43382b
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name CodeDeploy-ASG \
    --min-size 2 \
    --max-size 5 \
    --desired-capacity 3 \
    --vpc-zone-identifier subnet-0d0d135a41406a18e subnet-025975f8ff5fda79e \
    --availability-zones us-east-1a us-east-1b \

git clone https://github.com/LeQuangHai204/enquiry-web.git;cd enquiry-web/;git config --global user.email "lequanghai.private@gmail.com";git config --global user.name "LeQuangHai204";rm -rf .git;git init; git add .;git config --global user.email "lequanghai.private@gmail.com";git config --global user.name "LeQuangHai204";git commit -am "Init commit";

apt update;apt install ca-certificates curl apt-transport-https lsb-release gnupg -y;curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null;AZ_REPO=$(lsb_release -cs);echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list;apt install azure-cli -y;

az login;

az webapp deployment source config-local-git --resource-group cos40006-resource-group --name cos40006-web-app;az webapp deployment list-publishing-credentials --resource-group cos40006-resource-group --name cos40006-web-app;

git remote remove azure;git remote add azure "https://$cos40006-web-app:2sfsqWY1mkSxZrXwiPAGJqQPsuoeHBNbuh49W9TYpjQmQknmunbcsAcZujjG@cos40006-web-app.scm.azurewebsites.net";git push azure master

