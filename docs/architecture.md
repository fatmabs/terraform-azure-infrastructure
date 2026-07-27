# Azure Infrastructure Architecture

## Overview

This project provisions Azure infrastructure using Terraform following Infrastructure as Code best practices.

The infrastructure is divided into multiple environments:

- Dev
- Staging
- Production

Each environment has its own Terraform state and uses reusable Terraform modules.

## Components

### Networking

- Virtual Network
- Subnets
- Network Security Groups

### Compute

- Linux Virtual Machine
- Network Interface
- Public IP


## Terraform Design

The project follows a modular Infrastructure as Code (IaC) approach.

The Terraform configuration is organized into:

- Reusable modules
- Environment-specific configurations
- Variable-driven deployments
