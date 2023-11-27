# azure-defender-for-cloud

```sh
terraform init
terraform apply -auto-approve
```

## Interactive guides

- Attack paths
- Hunting
- Posture
- Security governance (rules) - weekly email is sent to owners with the recommendations they're assigned to



- Multi-cloud
- Visibility of vulnerabilities with agentless scanning
- Protect workloads with alerts correlation
- Malware Scanning
- Container threat detection and policy enforcement
- Protect your APIs

## Roles

There are two specific roles for Defender for Cloud:

- Security Administrator
- Security Reader

## Data collection for Servers

From the docs: https://learn.microsoft.com/en-us/training/modules/configure-integrate-analytics-agent-defender-cloud/2-set-security-event-option-workspace-level

- Azure Monitor Agent (AMA)
- Microsoft Defender for Endpoint (MDE)
- Log Analytics agent
- Azure Policy Add-on for Kubernetes

https://learn.microsoft.com/en-us/azure/defender-for-cloud/sql-azure-vulnerability-assessment-enable