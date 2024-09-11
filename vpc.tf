{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh17440\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
provider "aws" \{\
  region = var.aws_region\
\}\
\
data "aws_availability_zones" "available" \{\}\
\
locals \{\
  cluster_name = "abhi-eks-$\{random_string.suffix.result\}"\
\}\
\
resource "random_string" "suffix" \{\
  length  = 8\
  special = false\
\}\
\
module "vpc" \{\
  source  = "terraform-aws-modules/vpc/aws"\
  version = \'935.13.0\'94\
\
  name                 = \'93ajay-eks-vpc"\
  cidr                 = var.vpc_cidr\
  azs                  = data.aws_availability_zones.available.names\
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]\
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]\
  enable_nat_gateway   = true\
  single_nat_gateway   = true\
  enable_dns_hostnames = true\
  enable_dns_support   = true\
\
  tags = \{\
    "kubernetes.io/cluster/$\{local.cluster_name\}" = "shared"\
  \}\
\
  public_subnet_tags = \{\
    "kubernetes.io/cluster/$\{local.cluster_name\}" = "shared"\
    "kubernetes.io/role/elb"                      = "1"\
  \}\
\
  private_subnet_tags = \{\
    "kubernetes.io/cluster/$\{local.cluster_name\}" = "shared"\
    "kubernetes.io/role/internal-elb"             = "1"\
  \}\
\}}
