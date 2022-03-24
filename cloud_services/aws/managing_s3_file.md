# Creating bucket, uploading file to s3 & downloading file from s3 (aws management console & aws cli)

## Creating bucket

### using aws console
1. Sign in to the aws.amazon.com/console
2. Type `s3` in search box and go to the page of s3 buckets list.
3. Click `create bucket` button.
4. Add Bucket name. The bucket name must:
  - Be unique across all of Amazon S3.
  - Be between 3 and 63 characters long.
  - Not contain uppercase characters.
  - Start with a lowercase letter or number.
After you create the bucket, you cannot change its name
5. Set aws region
6. Choose `Block all public access` for private used
   (Then other settings are set as your needs.)
7. Choose `Create bucket`

### using aws cli

```
$ aws s3api create-bucket --bucket {my-bucket-name} --region {region}

eg. aws s3api create-bucket --bucket my-bucket --region us-east-1

```

## uploading file

### using aws console
1. Click target bucket name
2. Click `upload` button
3. Click `Add files` (if you want to upload folder, click `Add folder`)
4. Then, click `Upload`

### using aws cli
(i) for uploading single file
```
$ aws s3 cp {source_directory} s3://{bucket_name}/{destination_folder}

eg. aws s3 cp Desktop/test/hello.csv s3://my-bucket/
```

(ii) for uploading multi files or folder
- using <b>copy recursive</b>
```
$ aws s3 cp {source_directory} s3://{bucket_name}/{destination_folder} --recursive

eg. aws s3 cp Desktop/test/ s3://my-bucket/ --recursive
```

- using <b>Sync</b> - a command used to synchronize source and target directories, processes the updated, new, and deleted files. Sync is by default recursive.
```
$ aws s3 sync {local_directory} s3://{bucket_name}/
```

other usage:
- filter files with `.csv` extension, and uploads them to `my_csv` folders
```
aws s3 cp Desktop/test/ s3://my-bucket/my_csv/  --recursive   --exclude * --include *.csv
```

## downloading file

### using aws console
1. Click target bucket name
2. Click target file name
3. Then, click `Download`

### using aws cli
```
$ aws s3 cp s3://{bucket_name}/{source_file} {local_directory}

eg. aws s3 cp s3://my-bucket/hello.txt Desktop/
```

Ref:

- https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html

- https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/create-bucket.html
