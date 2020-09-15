## Lambda Training

#### Outline

In this lesson we are going to setup a lambda function that reads and writes to a S3 bucket. 

All automation code must be **Terraform v0.12** and must be formatted using `terraform fmt`. Code must be created in a branch on this git repository
and must follow proper gitflow. For a PR to be merged a proper terraform plan must be presented to the PR reviewer.

#### Lesson 1

Please do the following:

1. Use the S3 bucket called `cloudlogixtrtfstate`, which will hold your terraform remote state.
2. Create a branch on this repository called `lambdaautomationtr`, which you will use to develop off of.
3. Setup your terraform to use the above s3 bucket as your `remote terraform state`.
4. Develop a lambda function in Golang that does the following:
    a. Connects to a environment variable defined S3 bucket
    b. Reads from a file (lambdaread.txt) in that bucket
    c. Writes every third word in the above file to a new file (lambdawrite.txt) in the same bucket
4. With terraform create:
    a. The s3 bucket, including the file to read (lambdaread.txt)
    b. The lambda function with the necessary IAM permissions
6. Run a plan to see what is going to happen when the terraform code runs

This all assumes that you setup your workstation/provider with the necessary credentials to let Terraform create the resource.