## EC2 Training
# Outline

In this lesson we are going to setup a web-based application that is loadbalanced in the us-east2 region.

All automation code must be <b>Terraform v0.12</b> and must be formatted using ```terraform fmt```. Code must be created in a branch on this git repository and must follow proper gitflow. For a PR to be merged a proper terraform plan must be presented to the PR reviewer.

Lesson 1

Please do the following:

    1. Use the S3 bucket called ```cloudlogixtrtfstate```, which will hold your terraform remote state.
    2. Create a branch on this repository called ```ec2automationtr```, which you will use to develop off of.
    3. Setup your terraform to use the above s3 bucket as your ```remote terraform state```.
    4. With terraform create two EC2 instances with the following attributes:
       * Latest debian OS using AMI data resource
       * Disk space should be 10GB of standard disk <b>not</b> SSD.
       * Instance type should be <b>t2.micro</b>
       * Use a provisioner within the <b>aws_ec2_instance</b> resource to install the nginx server on the instance.
    5. With terraform create an ELB load balancer and add the above instances to it.
    6. Run a plan to see what is going to happen when the terraform code runs.

This all assumes that you setup your workstation/provider with the necessary credentials to let Terraform create the resource.