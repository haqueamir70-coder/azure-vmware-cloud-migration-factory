# Senior-level VMware-to-Azure migration interview guide

Use these answers as a structure; tailor them to experience you can substantiate. Do not present this portfolio as a real customer migration.

## 1. How would you migrate 50–100 VMware servers with minimum downtime?
Start with inventory, dependency mapping, application criticality, performance baselines, supportability, RTO/RPO and business ownership. Build and validate a secure landing zone first. Group workloads into dependency-aware waves, run a low-risk pilot, rehearse test migration, measure replication lag, and execute only with explicit go/no-go and rollback gates. Validate business transactions and operational controls before retiring the source.

## 2. What decides the migration tool?
Workload OS/supportability, guest and application constraints, data volume/change rate, downtime budget, application consistency, database type, connectivity, licensing and target architecture. Azure Migrate, Azure Site Recovery and database-specific tools have different roles and prerequisites; they are not interchangeable and must be chosen after assessment.

## 3. How do you estimate downtime?
Do not guess from VM count. Measure boot/readiness time, final delta replication, write freeze, DNS/traffic transition, application startup, data validation and business acceptance in a rehearsal. Define the downtime clock and acceptance criteria with the business owner.

## 4. How do you design the network?
Analyze IP overlap, address plan, hybrid connectivity, routing symmetry, DNS forwarders/resolution, firewall policy, egress and private connectivity. Use hub-spoke or Virtual WAN based on requirements. Validate application flows and failover paths. Avoid broad inbound rules and public exposure by default.

## 5. How do you plan database migration?
Assess engine/version compatibility, schema and feature differences, data volume, change rate, transaction consistency, authentication, encryption, CDC/replication options and connection-string dependencies. Test reconciliation and performance under representative load; write freeze/final sync must be database-specific.

## 6. What is the rollback strategy?
Predefine decision owner, triggers, deadline, authoritative data source, write freeze and reverse recovery method. DNS rollback alone is not sufficient if writes happened on the target. Rehearse the procedure and retain source capacity until acceptance/retirement gates pass.

## 7. Where does Terraform fit?
Terraform provisions repeatable landing-zone resources and governance patterns. It should not be described as replacing Azure Migrate discovery, replication orchestration, database-specific cutover, or application validation. Protect remote state, use short-lived CI identity, review plans and separate environments.

## 8. How do you secure migration?
Least privilege, temporary access, private connectivity where suitable, segmentation, secure credentials/Key Vault, encryption, diagnostic logs, security baselines, vulnerability/agent checks, data classification, evidence retention and explicit removal of temporary permissions after migration.

## 9. How do you prove success?
Use agreed metrics: workloads accepted, application test pass rate, observed downtime and data loss, cutover success, incident rate, latency/performance, backup and restore evidence, vulnerabilities, operational handover completion and cost variance. State measured values only.

## 10. How do you avoid a big-bang failure?
Use discovery, a representative pilot, small dependency-coherent waves, rehearsals, stage gates, named owners, a change freeze strategy, timed decision points and feedback between waves.