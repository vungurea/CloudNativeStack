# Cloud Native Stack with IaC and Intersight

## Prerequisites and Getting Stated
1. Perform initial setup of HyperFlex Nodes and claim devices into Intersight
2. Generate an API Key for terraform
3. Download and install terraform
4. Clone this repo
5. Define parameters for your HyperFlex cluster in `infra/2_deploy_hyperflex/hyperflex.tf`
6. Deploy HyperFlex using terraform
7. Define parameters for your k8s cluster`infra/3_deploy_kubernetes/kubernetes.tf`
8. Deploy kubernetes using terraform