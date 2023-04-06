data "aws_security_group" "sg1" {
  name = "webserver"
  id   = "sg-0bc3dc6dd1e48875f"

}


resource "aws_instance" "demo1" {
  ami                    = var.ami_type
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.sg1.id]
  key_name               = "dev-wdp"
  user_data              = file("${path.module}/postgresql.sh")
  tags = {
    "Name" = var.instance_name
    "env"  = var.env
    "team"   = var.team
  }
}
