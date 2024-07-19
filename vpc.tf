

# Data source to reference an existing VPC
data "aws_vpc" "existing" {
  id = "vpc-12345678"  # Replace with your existing VPC ID
}

# Example: Fetching existing subnets
data "aws_subnets" "existing" {
  vpc_id = data.aws_vpc.existing.id
}

# Example: Use existing VPC's subnets for your EKS cluster
resource "aws_eks_cluster" "eks" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = data.aws_subnets.existing.ids
  }
}
