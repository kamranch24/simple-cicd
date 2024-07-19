

# Data source to reference an existing VPC
data "aws_vpc" "existing" {
  id = "vpc-0d6cf5d879b144cab"  # Replace with your existing VPC ID
}

# Example: Fetching existing subnets
# Data source to reference an existing subnet
data "aws_subnet" "existing_subnet" {
  id = "subnet-0bc0270efdbd510c5"  # Replace with your existing subnet ID
}


# Example: Use existing VPC's subnets for your EKS cluster
resource "aws_eks_cluster" "eks" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = data.aws_subnets.existing.ids
  }
}
