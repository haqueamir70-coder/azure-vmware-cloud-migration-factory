# Cutover and validation runbook

## Before the window
- Confirm approved change, exact scope, decision maker, stakeholder bridge and communications.
- Confirm replication is healthy and latest sync/lag is within workload-specific threshold.
- Confirm backup/recovery points, source-state preservation and tested rollback procedure.
- Verify routing, firewall rules, DNS, certificates, identity, monitoring, alerting and access.
- Publish timestamped go/no-go checklist and pass/fail acceptance criteria.
- Define a maximum validation period and explicit rollback trigger in advance.

## During the window
1. Record start time and obtain formal go decision.
2. Apply the approved application/database write freeze or consistency procedure.
3. Execute final synchronization and migration/cutover using the selected service runbook.
4. Apply the approved traffic/DNS/load-balancer changes.
5. Validate VM/OS, application health, critical user journeys, database consistency, ports, identity, integrations, monitoring and backup.
6. Have the application owner sign off; record evidence and actual observed timings.
7. If criteria fail, follow the rollback decision process — do not improvise a reverse migration.

## After acceptance
Monitor error rates, latency, resource saturation, logs, backup jobs, security posture and costs through the agreed hypercare period. Update CMDB, DNS/IP records, diagrams, runbooks, ownership and support rota only after verified acceptance. Preserve the source until the retention/retirement gate is approved.