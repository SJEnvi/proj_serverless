variable "bucket_name" {
  type = string
  default = "my-new-bucket"
}

variable "env_type" {
  type = string
  default = "Dev"
}

variable "acl_public" {
  type = string
  default = "public-read"
}

variable "index_source" {
  type = string
  default = "www/index.html"
}

variable "type_html" {
  type = string
  default = "text/html"
}

variable "index_key" {
  type = string
  default = "index.html"
}

variable "error_key" {
  type = string
  default = "error.html"
}

variable "error_source" {
  type = string
  default = "www/error.html"
}