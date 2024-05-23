#!/bin/bash
sudo mysql -uroot <<CREATE_TEST_DB
CREATE DATABASE IF NOT EXISTS my_test;
CREATE_TEST_DB
