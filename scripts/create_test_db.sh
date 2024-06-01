#!/bin/bash
sudo mysql -u admin -p Hai204fromtheocean -h cos40006-codedeploy-rds.cwgruczxadko.us-east-1.rds.amazonaws.com -P 3306<<CREATE_TEST_DB
CREATE DATABASE IF NOT EXISTS test;
CREATE_TEST_DB
