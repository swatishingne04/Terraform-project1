resource "aws_s3_bucket" "mybucket1" {
  bucket = var.bucketname


}
resource "aws_s3_bucket_ownership_controls" "mybucket1" {
  bucket = aws_s3_bucket.mybucket1.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "mybucket1" {
  bucket = aws_s3_bucket.mybucket1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mybucket1" {
  depends_on = [
    aws_s3_bucket_ownership_controls.mybucket1,
    aws_s3_bucket_public_access_block.mybucket1,
  ]

  bucket = aws_s3_bucket.mybucket1.id
  acl    = "public-read"
}
resource "aws_s3_object" "index1" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "index1.html"
  source = "index1.html"
  acl  =   "public-read"
  content_type="text/html"
}
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "error.html"
  source = "error.html"
  content_type="text/html"
}
resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "download.jpg"
  source = "download.jpg"
   acl  =   "public-read"
}
resource "aws_s3_object" "espresso" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "espresso.jpg"
  source = "espresso.jpg"
   acl  =   "public-read"
}
resource "aws_s3_object" "latte" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "latte.jpg"
  source = "latte.jpg"
   acl  =   "public-read"
}
resource "aws_s3_object" "cappuccino" {
  bucket = aws_s3_bucket.mybucket1.id
  key    = "cappuccino.jpg"
  source = "cappuccino.jpg"
   acl  =   "public-read"
}
# resource "aws_s3_bucket_object" "s3_object" {
#   bucket = aws_s3_bucket.mybucket.id
#   for_each= fileset("C:\\Users\\HP\\Desktop\\Dice","*")
#   key    = each.value
#   source = "C:\\Users\\HP\\Desktop\\Dice\\${each.value}"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = filemd5("C:\\Users\\HP\\Desktop\\Dice\\${each.value}")
# }

# variable "named_folder" {
  
#   type = string
#   default="images"
# }
# resource "aws_s3_bucket_object" "base_folder" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl="private"
#   key    = "${var.named_folder}/"
#  content_type="application/x-directory"
# }

# resource "aws_s3_bucket_object" "S3object_inside_dir" {
#   bucket = aws_s3_bucket.mybucket.id
#   for_each= fileset("C:\\Users\\HP\\Desktop\\Dice\\images","*")
#   key    = "${var.named_folder}/${each.value}"
#   source = "C:\\Users\\HP\\Desktop\\Dice\\images\\${each.value}"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = filemd5("C:\\Users\\HP\\Desktop\\Dice\\images\\${each.value}")
# }
# variable "named_folder1" {
  
#   type = string
#   default="sound"
# }
# resource "aws_s3_bucket_object" "base_folder1" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl="private"
#   key    = "${var.named_folder1}/"
#  content_type="application/x-directory"
# }

# resource "aws_s3_bucket_object" "S3object_inside_sound_dir" {
#   bucket = aws_s3_bucket.mybucket.id
#   for_each= fileset("C:\\Users\\HP\\Desktop\\Dice\\sound","*")
#   key    = "${var.named_folder1}/${each.value}"
#   source = "C:\\Users\\HP\\Desktop\\Dice\\sound\\${each.value}"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = filemd5("C:\\Users\\HP\\Desktop\\Dice\\sound\\${each.value}")
# }






resource "aws_s3_bucket_website_configuration" "mybucket1" {
  bucket = aws_s3_bucket.mybucket1.id

  index_document {
    suffix = "index1.html"
  }
  error_document {
    key = "error.html"
  }
}