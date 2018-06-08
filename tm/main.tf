provider "aws" {
  region     = "${var.aw_region}"
  access_key = "${var.aw_access_key}"
  secret_key = "${var.aw_secret_key}"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tomcat" {
  ami             = "${var.amiid}"
  instance_type   = "t2.micro"
  key_name        = "${var.keyname}"
  security_groups = ["${aws_security_group.allow_all.name}"]

  tags {
    name = "tomact-7"
  }

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"

    // private_key = "${file("/Users/jayagopal.reddy/Documents/Scripts/terraform/jenkins.pem")}"

    //private_key = "${var.private_key_path}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install tomcat7 -y",
    ]
  }
}



  
}