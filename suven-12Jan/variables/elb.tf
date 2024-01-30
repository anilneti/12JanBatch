/*provider "aws" {
  region     = "ap-south-1"
}

resource "aws_elb" "bar" {
  #name               = "foobar-terraform-elb"
  availability_zones = var.az

  listener {
    instance_port     = 8000
    
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  #instances                   = [aws_instance.foo.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}
*/