#!/bin/bash
sudo mysql -u root -p new_password <<CREATE_TEST_DB
CREATE DATABASE IF NOT EXISTS test;
CREATE_TEST_DB
