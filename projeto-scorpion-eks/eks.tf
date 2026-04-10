resource "aws_eks_cluster" "scorpion" {
  name     = "scorpion-cluster"
  role_arn = aws_iam_role.scorpion_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id, 
      aws_subnet.public_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]
}

resource "aws_eks_node_group" "scorpion_nodes" {
  cluster_name    = aws_eks_cluster.scorpion.name
  node_group_name = "scorpion-nodes"
  node_role_arn   = aws_iam_role.scorpion_nodes_role.arn
  
  # Usando as subnets públicas para garantir o JOIN do nó sem precisar de NAT Gateway
  subnet_ids      = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  instance_types = ["t3.micro"]
  capacity_type  = "ON_DEMAND" 

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
  ]
}
