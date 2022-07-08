resource "random_pet" "this" {
  length = 1
  keepers = {
      sse_encrypt = var.sse_encrypt
    }
}

resource "aws_s3_object" "this" {
  for_each = fileset(var.file_path, "**")

  content_type           = lookup(jsondecode(file("${path.module}/src/mime.json")), regex("\\.[^.]+$", each.value), null)
  content_language       = var.content_language
  cache_control          = var.cache_control
  acl                    = var.acl
  bucket                 = var.bucket_id
  storage_class          = var.storage_class
  key                    = each.value
  source                 = "${var.file_path}/${each.value}"
  etag                   = filemd5("${var.file_path}/${each.value}")
  server_side_encryption = random_pet.this.keepers.sse_encrypt ? "AES256" : null

  lifecycle {
    replace_triggered_by = [
      random_pet.this.keepers.sse_encrypt
    ]
  }
}