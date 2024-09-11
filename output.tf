{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh17440\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 output "cluster_id" \{\
  description = "EKS cluster ID."\
  value       = module.eks.cluster_id\
\}\
\
output "cluster_endpoint" \{\
  description = "Endpoint for EKS control plane."\
  value       = module.eks.cluster_endpoint\
\}\
\
output "cluster_security_group_id" \{\
  description = "Security group ids attached to the cluster control plane."\
  value       = module.eks.cluster_security_group_id\
\}\
\
output "region" \{\
  description = "AWS region"\
  value       = var.aws_region\
\}\
\
output "oidc_provider_arn" \{\
  value = module.eks.oidc_provider_arn\
\}\
\
#output "zz_update_kubeconfig_command" \{\
  # value = "aws eks update-kubeconfig --name " + module.eks.cluster_id\
#  value = format("%s %s %s %s", "aws eks update-kubeconfig --name", module.eks.cluster_id, "--region", var.aws_region)\
#\}\
}
