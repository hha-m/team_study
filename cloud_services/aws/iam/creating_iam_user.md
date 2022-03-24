# creating iam user

## using aws console

1. Create Group and attaching policies
(i) Type IAM in search box
(ii) On the left navigation menu, choose `User groups` From `Access management`.
(iii) Click `create group` button.
  - Add group name
  - Add user if there is already created user (optional)
  - Attach permissions policies (optional)
  -> such as `AdministratorAccess`
(iv) Click `create group`

2. Add User to the existing group

(i) On the left navigation menu, choose `User` From `Access management`.
(ii) Click `Add users` button.
 - Add user name
 - Select AWS access type (check Access key - Programmatic access)
 - Add user to existing group (check desired group)
(iii) Click `Next:Tags`
(iv) Add key and Value (optional)
(v) Click `Next: Review`
(vi) Check your settings for iam user to be created. Then, click `Create user`

## using aws cli

1. Create group and attaching policies
```
$ aws iam create-group --group-name {group_name}

eg. aws iam create-group --group-name Developers
```

** List IAM groups
```
aws iam list-groups
```

2. Attaching permissions policies to the user group

(i) add a policy giving full administrator permissions

```
aws iam attach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/ AdministratorAccess
```
**If the command is successful, there is no response.

(ii) confirm the policy is attached to the Admins user group

```
aws iam list-attached-group-policies --group-name MyIamGroup
```

3. create IAM user
```
$ aws iam create-user --user-name {user_name}

eg. aws iam create-user --user-name MyUser
```

4. Add user to existing group
```
$ aws iam get-group --group-name {group_name}

eg. aws iam get-group --group-name MyIamGroup
```

5. Set first time password for IAM user
```
aws iam create-login-profile --user-name MyUser --password {password} --password-reset-required
```
**Changing password of IAM user

```
aws iam update-login-profile --user-name MyUser --password {new_password}
```

Ref:

- https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html

- https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-services-iam-new-user-group.html
