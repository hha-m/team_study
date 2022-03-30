## What is AWS Elastic Beanstalk?
 - Elastic Beanstalk, you can quickly deploy and manage applications in the AWS Cloud without having to learn about the infrastructure that runs those applications. 
 - You simply upload your application, and Elastic Beanstalk automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring.
 - Elastic Beanstalk supports applications developed in Go, Java, .NET, Node.js, PHP, Python, and Ruby.
 - You can also perform most deployment tasks, such as changing the size of your fleet of Amazon EC2 instances or monitoring your application, directly from the Elastic Beanstalk web interface (console).

 ■AWS resources created for the example application
 - **EC2 instance** ：An Amazon EC2 virtual machine configured to run web apps on the platform you choose.
 - **Instance security group** ：An Amazon EC2 security group configured to allow incoming traffic on port 80. This resource lets HTTP traffic from the load balancer reach the EC2 instance running your web app. By default, traffic is not allowed on other ports.
 - **Amazon S3 bucket**：A storage location for your source code, logs, and other artifacts that are created when you use Elastic Beanstalk.
 - **Amazon CloudWatch alarms** ：Two CloudWatch alarms that monitor the load on the instances in your environment and are triggered if the load is too high or too low. When an alarm is triggered, your Auto Scaling group scales up or down in response.
 - **AWS CloudFormation stack**：Elastic Beanstalk uses AWS CloudFormation to launch the resources in your environment and propagate configuration changes. 
 - **Domain name**：A domain name that routes to your web app in the form subdomain.region.elasticbeanstalk.com.

 ## [Configuring AWS EC2 instances for your environment using the AWS CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.managing.ec2.html#using-features.managing.ec2.aws-cli)
 ### ec2 instance
  - An Amazon EC2 instance is a virtual server in Amazon's Elastic Compute Cloud (EC2) for running applications on the Amazon Web Services (AWS) infrastructure. 
 ### Example 1 — create a new arm64 based environment (namespace options inline)
 - step1: create app
   - $ aws elasticbeanstalk create-application --application-name **my-app**
 - step2: create app version
   - $ aws elasticbeanstalk create-application-version --application-name **my-app** --version-label **v1**
 - step3: create environment
   - $ aws elasticbeanstalk create-environment --region **ap-northeast-1** --application-name **my-app** --environment-name **my-env** --solution-stack-name "**64bit Amazon Linux 2 v3.3.9 running PHP 8.0**" --option-settings Namespace=aws:autoscaling:launchconfiguration,OptionName=IamInstanceProfile,Value=aws-elasticbeanstalk-ec2-role Namespace=aws:ec2:instances,OptionName=InstanceTypes,Value=**t4g.small**

## 【memo】
### region check
 - $ aws configure list
### describe region
 - $ aws ec2 describe-regions
### solution stacks list
 - $ aws elasticbeanstalk list-available-solution-stacks
### instance type list
 - https://aws.amazon.com/ec2/instance-types/
### application download link
 - https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/GettingStarted.DeployApp.html

