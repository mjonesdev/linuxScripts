#!/bin/bash

##################################
# Script for the installation and setup of PostgrSQL
##################################

# Setup repo

sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-35-x86_64/pgdg-fedora-repo-latest.noarch.rpm;

# Install PostgrSQL

sudo dnf install -y postgresql14-server;

# Configure PostgreSQL

## Initialise database and set to start on boot
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14


## Start service
postgresql-setup --initdb
systemctl enable postgresql.service
systemctl start postgresql.service

## create user and database

sudo su - postgres;
psql -c "CREATE USER matt WITH CREATEDB; CREATE DATABASE matt;"