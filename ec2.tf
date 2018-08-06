provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "ron-terraform-v00" {
  ami           = "${var.ami_ID}"
  instance_type = "${var.instance_class}"
  key_name      = "terraform-key"
  
  tags {
    Name	= "ron-terraform-v00"
    Environment = "staging"
  }
  
  depends_on = ["aws_key_pair.terraform-key"]
}

resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform-key"
  public_key = "${var.publickey}"
}


output "ec2_id" {
  value = "${aws_instance.ron-terraform-v00.id}"
}
output "pubic_dns" {
  value = "${aws_instance.ron-terraform-v00.public_dns}"
}
output "security_group" {
  value = "${aws_instance.ron-terraform-v00.security_groups}"
}
