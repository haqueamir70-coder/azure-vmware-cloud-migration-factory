# Rollback decision and execution

Rollback is workload-specific. Reversing traffic alone may not restore data consistency after writes have occurred on the target. Define the authoritative data source and write handling before cutover.

## Trigger examples
- Critical business transaction fails beyond the agreed validation threshold.
- Data consistency/reconciliation fails.
- Critical integration, identity, DNS or network path cannot be restored within the approved timebox.
- Security, performance or availability violates an explicit go/no-go criterion.

## Decision
1. Pause further changes and collect timestamps, observed failures and impact.
2. Convene the named incident/change decision owner and application/database owner.
3. Compare the observed failure against the pre-approved acceptance criteria.
4. Decide continue/fix within timebox, or rollback. Record who made the decision and when.

## Execution framework
- Stop or control writes according to the application/database-specific recovery plan.
- Restore the previously agreed traffic path only when source data authority and consistency are known.
- Restore DNS/load-balancer/routing changes from the change record; validate TTL and cache behaviour.
- Execute the service-specific reverse/recovery method where appropriate.
- Re-run source-side application and business tests.
- Notify stakeholders, preserve evidence and open a root-cause review.

## Never assume
- Repointing DNS automatically reverses database changes.
- An old source VM remains a valid system of record after writes occur on Azure.
- A snapshot by itself is a proven application-consistent recovery plan.

## Closure
Record actual downtime, data loss (if any), recovery duration, decision path, issues and remediation actions. Update the runbook and repeat a rehearsal before another attempt.