variable "bucket_id" {
  type = string
  description = "The bucket id to use as the destination for the static website"
}

variable "file_path" {
  type = string
  description = "The base filepath that contains the files to publish, you may need path.module/my/src/dir"
}

variable "acl" {
  type = string
  default = "public-read"
  description = "The object acl to use for this site, defaults to public-read"
}

variable "storage_class" {
  type = string
  default = "STANDARD"
  description = "The object storage class to use for this site, defaults to STANDARD"
}