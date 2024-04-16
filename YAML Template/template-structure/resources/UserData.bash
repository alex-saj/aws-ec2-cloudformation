#!/bin/bash

# Step 1: Update Packages
sudo yum update -y

# Step 2: Install Apache HTTP Server
sudo yum install httpd -y

# Step 3: Start and Enable Apache Service
sudo service httpd start
sudo chkconfig httpd on

# Step 4: Copy Content from S3 Bucket (Replace s3-bucket-name with the name of the bucket)
sudo aws s3 cp s3://s3-bucket-name/ /var/www/html/ --recursive

# Step 5: Set Ownership for Web Server Files
sudo chown -R apache:apache /var/www/html

# Step 6: Restart Apache Service
sudo service httpd restart
