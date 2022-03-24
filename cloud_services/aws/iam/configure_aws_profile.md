# AWS configuration for IAM user

- requires the following user inputs:
IAM user Access Key ID
AWS Secret Access key
Default AWS region-name
Default output format


### Default AWS profile
```
$ aws configure
```

### Named profile
```
$ aws configure --profile {profile_name}

eg. aws configure --profile Developer
```

### list specific profile
```
$ aws s3 ls --profile {profile_name}

eg. aws s3 ls --profile Developer
```

### Setting profile name as environment variable
```
$ export AWS_PROFILE=profile_name
```
