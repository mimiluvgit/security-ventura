

resource "aws_security_group" "sg1" {
  name_prefix = "sg1-"
  description = "Security Group 1"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
}

resource "aws_security_group" "sg2" {
  name_prefix = "sg2-"
  description = "Security Group 2"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id]
  }
}

resource "aws_security_group" "sg3" {
  name_prefix = "sg3-"
  description = "Security Group 3"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  }
}

resource "aws_security_group" "sg4" {
  name_prefix = "sg4-"
  description = "Security Group 4"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg3.id]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg3.id]
  }
}

variable "my_ip" {
  description = "my_ip"
  default = "70.64.49.74/32"
}

output "security_group_ids" {
  value = [
    aws_security_group.sg1.id,
    aws_security_group.sg2.id,
    aws_security_group.sg3.id,
    aws_security_group.sg4.id
  ]
}

# provider "aws" {
#   region = "us-east-1"  # Set your desired AWS region
# }

# resource "aws_security_group" "sg1" {
#   name_prefix = "sg1-"
#   description = "Security Group 1"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = [var.my_ip]
#   }
# }

# resource "aws_security_group" "sg2" {
#   name_prefix = "sg2-"
#   description = "Security Group 2"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id]
#   }
# }

# resource "aws_security_group" "sg3" {
#   name_prefix = "sg3-"
#   description = "Security Group 3"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
#   }
# }

# resource "aws_security_group" "sg4" {
#   name_prefix = "sg4-"
#   description = "Security Group 4"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id, aws_security_group.sg3.id]
#   }

#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     security_groups = [aws_security_group.sg1.id, aws_security_group.sg3.id]
#   }
# }

# variable "my_ip" {
#   description = "70.64.49.74/32"
# }

# output "security_group_ids" {
#   value = [
#     aws_security_group.sg1.id,
#     aws_security_group.sg2.id,
#     aws_security_group.sg3.id,
#     aws_security_group.sg4.id
#   ]
# }
