resource "aws_s3_bucket_object" "this" {
  for_each = fileset(var.file_path, "**")

  content_type  = lookup(jsondecode(file("${path.module}/src/mime.json")), regex("\\.[^.]+$", each.value), null)
  acl           = var.acl
  bucket        = var.bucket_id
  storage_class = var.storage_class
  key           = each.value
  source        = "${var.file_path}/${each.value}"
  etag          = filemd5("${var.file_path}/${each.value}")
}