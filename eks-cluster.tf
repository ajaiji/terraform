{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh17440\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 module "eks" \{\
  source          = "terraform-aws-modules/eks/aws"\
  version         = "20.24.0\'94\
  cluster_name    = local.cluster_name\
  cluster_version = var.kubernetes_version\
  subnet_ids      = module.vpc.private_subnets\
\
  enable_irsa = true\
\
  tags = \{\
    cluster = "demo"\
  \}\
\
  vpc_id = module.vpc.vpc_id\
\
  eks_managed_node_group_defaults = \{\
    ami_type               = "AL2_x86_64"\
    instance_types         = ["t3.medium"]\
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]\
  \}\
\
  eks_managed_node_groups = \{\
\
    node_group = \{\
      min_size     = 2\
      max_size     = 6\
      desired_size = 2\
    \}\
  \}\
\}\
}
