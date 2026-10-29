# ADR-001: Migration factory scope

- **Status:** Accepted for portfolio reference design
- **Context:** A 50–100 server VMware-to-Azure migration requires more than VM replication. Discovery, dependencies, landing-zone readiness, identity/network/security, application consistency, cutover and operations must be planned.
- **Decision:** Separate (1) planning and governance templates, (2) Terraform-managed Azure foundation, (3) service-specific migration execution, and (4) application/business validation. The repository will clearly distinguish implemented automation from conceptual workflow.
- **Consequences:** The project can be reviewed and learned in modules without suggesting Terraform provisions every Azure migration service or that production migration has already happened. Actual service configuration needs workload assessment, service prerequisites, authorization, capacity and change approval.