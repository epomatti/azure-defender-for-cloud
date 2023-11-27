# azure-defender-for-cloud

```sh
terraform init
terraform apply -auto-approve
```

## Server protection

Defender will use Microsoft Defender for Endpoint for EDR, as well as [agentless][2] scanning based on the OS disk.

The AMA is [not required][1] for Defender but it is installed anyways in this VM.

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

https://microsoftlearning.github.io/Secure-Azure-services-and-workloads-with-Microsoft-Defender-for-Cloud-regulatory-compliance-controls/Instructions/Labs/LAB_04_Configure%20and%20integrate%20a%20Log%20Analytics%20agent%20and%20workspace%20in%20Defender%20for%20Cloud.html




https://learn.microsoft.com/en-us/azure/defender-for-cloud/sql-azure-vulnerability-assessment-enable





[1]: https://learn.microsoft.com/en-us/azure/defender-for-cloud/auto-deploy-azure-monitoring-agent
[2]: https://learn.microsoft.com/en-us/azure/defender-for-cloud/concept-agentless-data-collection
