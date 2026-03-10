# Governance & Security

Data governance in the KBase Data Lakehouse is built on the principles of Trust, Transparency, and FAIR (Findable, Accessible, Interoperable, Reusable) data stewardship.

## Security Model

### Authentication
*   **Single Sign-On (SSO)**: Integration with ORCID and DOE/National Lab identity providers.
*   **Token-Based Access**: API access secured via OAuth2/OIDC tokens.

### Authorization (RBAC)
We employ a fine-grained Role-Based Access Control system:

| Role | Permissions |
| :--- | :--- |
| **Data Steward** | Full control over tenant schemas, policy definition, and user management. |
| **Data Engineer** | Write access to pipelines, transformation jobs, and silver/gold tables. |
| **Researcher** | Read-only access to approved datasets, ability to create private sandbox tables. |
| **Public Viewer** | Access to strictly public, anonymized data only. |

## Data Lineage & Provenance

Every data asset in the Lakehouse tracks its history:
*   **Source Tracing**: Links back to original instrument files or external repositories.
*   **Transformation Logs**: Records of Spark jobs or scripts that modified the data.
*   **Versioning**: Delta Lake "Time Travel" allows querying older versions of any dataset.

## Compliance
*   **Embargo Support**: Automated enforcement of publication embargo periods.
*   **Audit Logging**: Immutable logs of all data access and modification events.
