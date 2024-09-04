# Terraform-project1

📝 Key Points:

-Define AWS Provider: Whenever we want to work with AWS on Terraform we need to first create a provider

-Create S3 Bucket: Start by creating an S3 bucket to store  your website files.The bucket name should be globally unique across all AWS accounts.

-Making Bucket Public: Allow public access to the S3bucket and its objects  by configuring the bucket policy or Access Control List(ACLs)

-Create Static website (eg.coffee lover) using html and css.(index.html)

-Upload Website Files: Upload your static website files (HTML,CSS, JS,images etc.)to theS3 bucket.

-Configure Bucket for Static Website Hosting: In the S3 bucket properties,enable static website hosting and specify the default index document (index.html) and optional error document(error.html)

-Testing the Website: Once the setup is done,you can tets the static website by accessing it through the S3 bucket website url.

