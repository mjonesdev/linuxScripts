#!/bin/bash

##################################
# Script for the installation and setup of PostgrSQL
##################################

# Install PostgrSQL

sudo dnf install -y postgresql postgresql-libs postgresql-plperl postgresql-plpython postgresql-server;

# Configure PostgreSQL

## Initialise database
postgresql-setup initdb

## Set to start on boot
chkconfig postgresql on

## Start service
service postgresql start

## create user and database

sudo su - postgres;
psql -c "CREATE USER matt WITH CREATEDB; CREATE DATABASE matt;"