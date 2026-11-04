# Zero-to-Hero Project Guide — Azure VMware migration factory

## 1. Business scenario
A customer has VMware workloads with dependencies and strict downtime/data-loss tolerances. Migration must be planned in safe waves with tested rollback.

## 2. Architecture and end-to-end flow
Discover inventory/dependencies → assess compatibility → group waves → pilot/test migration → go/no-go → cutover → app/business validation → optimize/decommission.

## 3. Tool-by-tool inventory
Azure Migrate, Azure VMware Solution (if selected), discovery/dependency mapping tools, networking/DNS, replication, Terraform/automation, runbooks, monitoring.

## 4. What you must understand before implementation
Understand the business requirement and success criteria first. Then learn the relevant network/security primitives, identity model, service limits, configuration files, deployment lifecycle, observability signals and recovery strategy. For every tool, be able to explain: what problem it solves, why it was selected, what alternative exists, how it is configured, how it fails and how you verify it.

## 5. Implementation / operations sequence
1. Read the repository README, source files, Terraform modules, manifests and workflow YAML.
2. Map every resource and tool to the architecture diagram.
3. Run local formatting, validation, unit tests and static scans.
4. Review the plan/build artifact before any deployment.
5. Deploy only to an authorized sandbox with least-privilege identity.
6. Verify actual service behavior, network paths, security boundaries and monitoring.
7. Record evidence, cleanup steps, cost and rollback procedure.

## 6. Scenario-based interview questions and answers
**Q: How choose a wave?** A: Dependency, criticality, compatibility, maintenance window, owner readiness and rollback complexity.

**Q: RTO vs RPO?** A: RTO is recovery time objective; RPO is acceptable data-loss window. Business owners approve and tests validate.

**Q: Cutover fails?** A: Use predefined go/no-go and rollback criteria, data consistency plan, communication tree and decision owner.

**Q: When decommission source?** A: Only after business sign-off, stable operations, backup/restore evidence, retention and compliance approval.

## 7. Troubleshooting method
Start with the user-visible symptom; establish scope and recent changes; inspect logs/events/metrics; verify identity and permissions; verify DNS/network path; inspect resource limits and service health; isolate one layer at a time; mitigate safely; then document root cause and prevention.

## 8. Security, reliability and cost
Use least privilege, secret management, encrypted transport/storage, explicit network boundaries, patching/scanning, backups, actionable alerts, capacity planning and owner accountability. Estimate cost drivers before scaling or enabling verbose diagnostics.

## 9. Zero-to-Hero study plan
**Foundation:** Linux, Git, networking, YAML/JSON and cloud fundamentals.  
**Project tools:** learn each tool in the inventory and reproduce the repository workflow.  
**Hands-on:** deploy a disposable environment, break one component deliberately, diagnose it and restore service.  
**Interview:** explain the business scenario, diagram, tool choices, data/request flow, security controls, failure modes, cost trade-offs and evidence without reading notes.

## 10. Evidence and scope honesty
This guide is a learning and interview companion. The repository's code, workflow runs and deployment evidence determine what is implemented. Explicitly label each capability as implemented, CI-validated, cloud-deployed or planned. Never claim a tool is used in the live project merely because it appears in a conceptual architecture.
