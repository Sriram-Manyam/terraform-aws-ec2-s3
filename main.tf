module "ec2" {
  source = "./modules/ec2"

  subnet_id = var.subnet_id

  instance_name = "Terraform-Apache-Server"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}
