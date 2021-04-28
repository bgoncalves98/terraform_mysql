resource "aws_default_security_group" "default" {

    vpc_id = var.vpc_id

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        ipv6_cidr_blocks     = ["::/0"]
    }
    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        ipv6_cidr_blocks     = ["::/0"]
    }
}

resource "aws_instance" "server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "key-file"

    tags = {
        Name = var.name
        Environment = var.env
        Provisioner = "Terraform"
    }
    

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file("key-file.pem")
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum -y update",
            "sudo wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm",
            "sudo rpm -Uvh mysql80-community-release-el7-3.noarch.rpm",
            "sudo yum -y install mysql-server",
            "sudo systemctl start mysqld"
        ]
    }
}