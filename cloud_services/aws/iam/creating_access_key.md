# creating access key & secret key for iam user

## using aws console
Open the IAM console at https://console.aws.amazon.com/iam/ .
1. On the left navigation menu, choose `Users` From `Access management`.
2. Choose your IAM user name (not the check box).
3. Open the Security credentials tab, and then choose Create access key.
4. To see the new access key, choose Show.
5. To download the key pair, choose Download

## using aws cli

```
$ aws iam create-access-key --user-name {IAM user name}
 
eg. aws iam create-access-key --user-name MyUser
```

ref:
https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-services-iam-create-creds.html