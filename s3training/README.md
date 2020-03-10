# S3 Training
## Outline

In this lesson we are going to setup an S3 bucket in the us-east2 region. The bucket will need to have the following attributes:

   - Bucket must be ```regional```
   - Bucket must use ```standard storage```

All automation code must be Terraform v0.12 and must be formatted using ```terraform fmt```. Code must be created in a branch on this git repository and must follow proper gitflow. For a PR to be merged a proper terraform plan must be presented to the PR reviewer.
Lesson

Please do the following:

    1. Create an S3 bucket called ```cloudlogixtrtfstate```, which will hold your terraform remote state.
    2. Create a branch on this repository called ```s3automationtr```, which you will use to develop off of.
    3. Setup your terraform to use the above s3 bucket as your ```remote terraform state```.
    4. Create an S3 bucket called ```cloudlogixs3auto``` with the following attributes:
       * Bucket must be ```regional```
       * Bucket must use ```standard storage```
    Upload a text file to the bucket once it is created that has the text ```Hello World!``` in it.
    Run a plan to see what is going to happen when the terraform code runs.
    Run an apply to make the changes live.

This all assumes that you setup your workstation/provider with the necessary credentials to let Terraform create the resource.