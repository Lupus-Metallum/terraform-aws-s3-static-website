# terraform-aws-s3-static-website

Used to publish static website files to an S3 bucket with proper MIME type, etag, acl, cache control, and object level server-side encryption.

## Terraform Versions Supported

`>=1.2.0`

## Example

``` Terraform
module "s3-static-website" {
  source        = "Lupus-Metallum/s3-static-website/aws"
  version       = "2.0.0"
  
  bucket_id        = aws_s3_bucket.example.id
  file_path        = "${path.module}/src/my-website-files/" # Where your index.html and TLD web content lives
  acl              = "public-read"
  storage_class    = "STANDARD"
  cache_control    = "max-age=31536000"
  content_language = "en-US"
  sse_encrypt      = true #Changing this variable will force the recreation of each file managed by this module
}
```

<!-- BEGIN_TF_DOCS -->

<img src="https://raw.githubusercontent.com/Lupus-Metallum/brand/master/images/logo.jpg" width="400"/>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_object.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | The bucket id to use as the destination for the static website | `string` | n/a | yes |
| <a name="input_file_path"></a> [file\_path](#input\_file\_path) | The base filepath that contains the files to publish, you may need path.module/my/src/dir | `string` | n/a | yes |
| <a name="input_acl"></a> [acl](#input\_acl) | The object acl to use for this site, defaults to public-read | `string` | `"public-read"` | no |
| <a name="input_cache_control"></a> [cache\_control](#input\_cache\_control) | The header to use for cache control | `string` | `"max-age=1440"` | no |
| <a name="input_content_language"></a> [content\_language](#input\_content\_language) | en-US or en-GB for language header? | `string` | `"en-US"` | no |
| <a name="input_sse_encrypt"></a> [sse\_encrypt](#input\_sse\_encrypt) | Should we apply SSE for objects created by this module? | `bool` | `true` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | The object storage class to use for this site, defaults to STANDARD | `string` | `"STANDARD"` | no |
<!-- END_TF_DOCS -->