# terraform-aws-s3-static-website

Used to publish static website files to an S3 bucket with proper MIME type

## Example

``` Terraform
module "s3-static-website" {
  source        = "Lupus-Metallum/s3-static-website/aws"
  version       = "1.1.0"
  
  bucket_id        = aws_s3_bucket.example.id
  file_path        = "${path.module}/src/my-website-files/" # Where your index.html and TLD web content lives
  acl              = "public-read"
  storage_class    = "STANDARD"
  cache_control    = "max-age=31536000"
  content_language = "en-US"
}
```
