provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "ron-terraform-v00" {
  ami           = "ami-0e86606d"
  instance_type = "t2.micro"
}

output "ec2_id" {
  value = "${aws_instance.ron-terraform-v00.id}"
}
