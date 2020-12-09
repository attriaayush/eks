# Security groups are for EC2 instances tied to the cluster
# allowing only worker instances over a private network

resource "aws_security_group" "worker-group-one" {
    name_prefix     = "worker-group-one"
    vpc_id          = module.vpc.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"

        cidr_blocks = [
            "10.0.0.0/8",
        ]
    }
}

resource "aws_security_group" "worker-group-two" {
    name_prefix     = "worker-group-two"
    vpc_id          = module.vpc.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"

        cidr_blocks = [
            "192.168.0.0/16",
        ]
    }
}

resource "aws_security_group" "master-group" {
    name_prefix     = "master-security-group"
    vpc_id          = module.vpc.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"

        cidr_blocks = [
            "10.0.0.0/8",
            "172.16.0.0/12",
            "192.168.0.0/16",
        ]
    }
}

