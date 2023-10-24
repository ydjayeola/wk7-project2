## Ec2 instance 

resource "aws_instance" "ec2-demo" {
    ami = "ami-033adaf0b583374d4"
    vpc_security_group_ids = [aws_security_group.sg-demo.id]
    instance_type = "t2.micro"
    key_name = "ec2-demo"
    subnet_id = aws_subnet.public_subnet1.id
    user_data =  <<EOF
#!/bin/bash
sudo yum update -y 
sudo yum install unzip wget httpd -y  
sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
sudo unzip main.zip
sudo rm -rf /var/www/html/*
sudo cp -r static-resume-main/* /var/www/html/  
sudo systemctl start httpd
sudo systemctl enable httpd 
     EOF
    tags={
        Name = "Terraform instance"
        env = "Dev"
    }

}