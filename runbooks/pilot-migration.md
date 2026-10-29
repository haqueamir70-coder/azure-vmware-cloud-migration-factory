# Pilot migration runbook

## Preconditions
- Approved pilot workload and accountable application owner.
- Current inventory, dependency list, RTO/RPO, support contacts and maintenance window.
- Landing-zone networking, routing, DNS, identity, logging, security and backup validated.
- Migration tooling configured and authorized with required service-specific prerequisites.
- Test plan, known-good backup/recovery point and rollback owner documented.
- Replication health is acceptable and the source remains authoritative until cutover is approved.

## Execution
1. Record change ID, start time, source identifiers and current source health.
2. Check replication status/lag and confirm change freeze requirements.
3. Perform test migration in an isolated test network; avoid duplicate production identity/IP conflicts.
4. Validate boot, OS health, routes, DNS, ports, identity, certificates, application endpoints, database connectivity, scheduled tasks, monitoring and backup.
5. Capture results, blockers, evidence and remediation owner.
6. Obtain application and platform approval before any production cutover.

## Exit criteria
All agreed tests pass; security and monitoring controls are present; business owner approves; rollback is credible and rehearsed; risks are accepted by named owners.

## Stop conditions
Unexpected data inconsistency, unresolved critical dependency, unhealthy replication, missing backup/recovery path, security control failure, or no accountable decision-maker. Stop and escalate rather than improvising.