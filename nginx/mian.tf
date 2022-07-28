resource "aws_instance" "app_server" {
  ami           = "ami-068257025f72f470d"
  instance_type = "t2.micro"
  key_name = "mumbai"
  user_data = data.template_file.init.rendered
  tags = {
    Name = "nginx"
  }
}

data "template_file" "init" {
  template = "${file("log.sh")}"

  vars = {
    device_name = "test"
  }
}
