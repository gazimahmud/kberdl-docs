# Multi-Tenant Model

The KBase Data Lakehouse (K-BERDL) utilizes a robust multi-tenant architecture designed to support diverse DOE BER programs while maintaining strict data isolation and security where needed.

## Tenant Architecture

The platform logically separates data and compute resources for each tenant organization (e.g., KBase, JGI, NMDC).

### 1. Data Isolation
Each tenant is provisioned with:
*   **Dedicated Object Storage Buckets**: Unique MinIO buckets for raw and curated data.
*   **Namespace Scoped Metadata**: Atlas/DataHub metadata types specific to the tenant's domain.
*   **Independent Schemas**: Lakehouse tables (Delta Lake) stored in tenant-specific schemas.

### 2. Compute Isolation
*   **Quotas & Limits**: CPU/RAM quotas ensuring no single tenant monopolizes cluster resources.
*   **Execution Environments**: Containerized workspaces (JupyterLab) run with tenant-specific service accounts.

## Onboarding Process

New BER programs can be onboarded as tenants through the following steps:

1.  **Tenant Registration**: Define administrative contacts and resource requirements.
2.  **Policy Configuration**: Establish default access policies (Public / Private / Embargoed).
3.  **Data Migration**: Batch ingestion of historical data via DTS.
4.  **Integration**: Connection of existing program APIs to the Lakehouse.

## Cross-Tenant Sharing

While tenants are isolated by default, the platform supports controlled sharing:
*   **Federated Queries**: Approved users can join tables across tenant schemas.
*   **Public Data Commons**: A shared, read-only layer for high-value public datasets (e.g., Reference Genomes).
