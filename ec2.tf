
data "aws_ami" "amzn2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Launch Template (no key pair)
resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = data.aws_ami.amzn2.id
  instance_type = "t3.micro"

  network_interfaces {
    security_groups = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(<<-EOT
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd

              cat <<HTML > /var/www/html/index.html
              <!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <title>My Terraform Project</title>
                  <style>
                      body {
                          background-color: #f0f4f8;
                          font-family: Arial, sans-serif;
                          display: flex;
                          justify-content: center;
                          align-items: center;
                          height: 100vh;
                          margin: 0;
                      }
                      .container {
                          text-align: center;
                          background-color: #ffffff;
                          padding: 40px;
                          border-radius: 12px;
                          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                      }
                      h1 {
                          color: #2c3e50;
                      }
                      p {
                          color: #34495e;
                          font-size: 18px;
                      }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>Hello!</h1>
                      <p>This is Bishal Ranjitkar.<br>And this is my Terraform project.</p>
                  </div>
              </body>
              </html>
              HTML
              EOT
  )

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name                      = "${var.project_name}-asg"
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 2
  vpc_zone_identifier       = aws_subnet.public[*].id
  health_check_type         = "EC2"
  health_check_grace_period = 60

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ec2"
    propagate_at_launch = true
  }


  force_delete = true
}

