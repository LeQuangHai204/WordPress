#!/bin/bash

sudo dnf install -y git
cd /tmp/
git clone https://github.com/LeQuangHai204/WordPress.git
cd WordPress/

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf install mysql-community-client -y
sudo rm mysql80-community-release-el9-1.noarch.rpm

aws deploy delete-application --application-name WordPress_App
aws deploy create-application --application-name WordPress_App
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