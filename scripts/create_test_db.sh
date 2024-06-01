#!/bin/bash

# Connect to the MySQL RDS instance and create a new database if it doesn't already exist
mysql -u admin -pHai204fromtheocean -h cos40006-codedeploy-rds.cwgruczxadko.us-east-1.rds.amazonaws.com -P 3306 <<CREATE_TEST_DB
CREATE DATABASE IF NOT EXISTS test;
CREATE_TEST_DB
