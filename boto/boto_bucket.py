import boto3

s3 = boto3.resource('s3', aws_access_key_id="123", aws_secret_access_key="124", endpoint_url="http://s3.localhost.localstack.cloud:4566")

def main():
    sess = boto3.client("s3", endpoint_url="http://s3.localhost.localstack.cloud:4566", region_name='us-east-1')

    bucket_name = 'bucketerie'

    sess.create_bucket(Bucket=bucket_name)
    #WANTED TO ADD WEBSITE CONFIGURATION BUT REALIZED HALFWAY THORUGH THAT IT'S NOT NEEDED FOR THE ASSIGNMENT
    # bucket_website = s3.BucketWebsite(bucket_name)

    # bucket_website.put(
    #     WebsiteConfiguration={
    #         'ErrorDocument': {
    #             'Key': 'error.html'
    #         },
    #         'IndexDocument': {
    #             'Suffix': 'index.html'
    #         }
    #     }
    # )
    # bucket_website.reload()

if __name__ == "__main__":
    main()

