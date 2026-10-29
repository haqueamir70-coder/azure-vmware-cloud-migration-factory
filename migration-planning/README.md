# Migration planning playbook

Use these templates to drive an evidence-based VMware-to-Azure migration. Treat example numbers as planning inputs, not measured results.

## 1. Discovery and assessment

For every workload collect: application/service name, business owner, technical owner, environment, OS/version, vCPU, memory, disk/IOPS, data-change rate, network interfaces, IP/DNS, ports/protocols, domain dependencies, database dependencies, certificates, licensing, backup/restore, maintenance windows, availability tier, RTO, RPO, target region, and data classification.

**Exit gate:** owner and dependency information are reviewed; unsupported OS/app/database components and licensing are tracked; business criticality and target disposition are agreed.

## 2. Workload disposition

Classify each workload using evidence: rehost, replatform, refactor/re-architect, replace, retain, or retire. Do not assume every VM should be migrated as-is.

## 3. Landing-zone readiness

- Subscription/resource-group strategy, naming, tagging, budgets and quotas.
- Hub-spoke or Virtual WAN decision; IP plan, overlap analysis, routing, firewalls and hybrid connectivity.
- DNS resolution path from on-premises and Azure; private DNS zones and conditional forwarding where required.
- Identity, RBAC/PIM, managed identities, Key Vault, Defender/security policy and logging.
- Backup, patching, monitoring, recovery objectives and operational ownership.
- IaC state protection, pipeline approval gates and change records.

## 4. Migration-wave design

Build waves around tightly coupled application dependencies, not only server count. Prefer a low-risk pilot. Each wave needs an owner, inventory, prerequisites, replication health checks, change window, validation script, business approver, rollback criteria, communication plan and hypercare period.

| Gate | Evidence required |
|---|---|
| Readiness | Assessment reviewed, blockers closed or accepted |
| Replication | Initial sync complete; current health and lag checked |
| Test migration | Application and connectivity checks pass in isolated test |
| Go/no-go | Owners approve; backups and rollback are ready |
| Cutover | Change freeze, final sync, cutover execution and DNS/load balancer steps recorded |
| Acceptance | Technical smoke tests and business transactions approved |
| Closure | Monitoring, backups, patching, CMDB, ownership, cost tags updated |

## 5. Minimum-downtime strategy

- Baseline data-change rate and network bandwidth; estimate initial replication and delta-sync windows.
- Test application-consistent vs crash-consistent recovery requirements.
- Reduce TTL ahead of approved cutover where applicable, considering resolver behaviour.
- Freeze writes or use application/database-specific migration methods for final consistency.
- Define a time-boxed validation window and a decision owner before cutover begins.
- Record the last known good source state and exact rollback trigger.
- Do not promise zero downtime without a workload-specific architecture and rehearsal that proves it.

## 6. Database considerations

Use a database-specific plan. Evaluate compatibility, schema objects, extensions, authentication, encryption, replication/CDC support, transaction consistency, data volume, latency and application connection-string changes. Select the appropriate Azure migration service and method only after assessment. Conduct data validation and reconciliation before business sign-off.

## 7. Risk register — starter

| Risk | Mitigation / evidence |
|---|---|
| Hidden application dependency | Dependency mapping, traffic observation, owner sign-off, pilot |
| IP overlap / DNS failure | Address-space inventory, DNS design, end-to-end resolution tests |
| Replication lag exceeds window | Measure change rate, capacity and link throughput; rehearse |
| Unsupported OS/database/licence | Compatibility and licensing review with accountable owner |
| Unexpected downtime | Backout criteria, approved outage window, tested rollback |
| Excess cloud spend | Right-size from telemetry, budgets, tags and post-migration reviews |
| Security posture regression | RBAC, network controls, vulnerability/agent checks and policy review |

## 8. Roles and responsibility

- **Migration lead:** schedule, wave readiness, go/no-go and escalation.
- **Application owner:** dependencies, acceptance criteria and business validation.
- **VMware/source team:** source access, snapshots/backup coordination, replication prerequisites.
- **Azure platform team:** landing zone, network, identity, policies, quotas and monitoring.
- **Database team:** migration design, consistency checks and reconciliation.
- **Security/compliance:** risk acceptance, access controls and evidence retention.
- **Service operations:** alerting, backup/restore, patching, on-call and handover.

Keep the detailed inventory and any sensitive topology in an approved internal system; only sanitized, synthetic examples belong in a public portfolio.