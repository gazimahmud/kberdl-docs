# BER Data Lakehouse

**A unified, AI-native data platform for DOE Biological and Environmental Research**

The **KBase BER Data Lakehouse (K-BERDL)** is a multi-tenant, FAIR-compliant data platform that brings together heterogeneous biological and environmental datasets from across the DOE BER ecosystem — including JGI, NMDC, EMSL, ESS-DIVE, and ARM — into a single, governed, AI-ready infrastructure.

Built on open standards (Delta Lake, Apache Parquet, Apache Atlas), K-BERDL provides scalable storage, portable compute, and fine-grained data governance to support the full scientific lifecycle: from raw data ingestion to AI-assisted discovery and cross-program collaboration.

---

## What It Does

| Capability | Description |
|---|---|
| **Unified Data Integration** | Harmonizes genomic, multi-omics, and environmental datasets across BER programs into a single queryable platform |
| **Multi-Tenant Governance** | Each BER program (KBase, JGI, NMDC, etc.) operates as an isolated tenant with its own schemas, storage, and access policies |
| **AI-Native Workflows** | Supports AI agents, automated annotation pipelines, and semantic search across harmonized scientific data |
| **Cross-Program Collaboration** | Federated queries and a shared public data commons enable integrative research across program boundaries |
| **FAIR & Reproducible** | End-to-end data lineage, provenance tracking, and Delta Lake time-travel ensure transparent and reproducible science |
| **Scalable Infrastructure** | Decoupled compute and storage scale independently to meet the demands of KBase's 50,000+ user community |

---

## Platform Architecture

K-BERDL is organized around three core layers:

- **Data Plane** — Object storage (MinIO/S3-compatible) with Delta Lake for transactional, versioned datasets. Supports Bronze → Silver → Gold data tiers.
- **Compute Plane** — Decoupled, portable compute via Spark, Ray, JupyterHub, and containerized task services. Runs on Kubernetes, HPC, or cloud.
- **Governance & Catalog** — A unified BER-wide metadata catalog (Apache Atlas) with fine-grained access controls at the table, column, row, and tag level.

[Explore the Architecture →](architecture.md)

---

## Tenant Model

BER programs onboard as independent **tenants** with:

- Dedicated MinIO buckets and Delta Lake schemas
- Program-specific metadata models and ingestion pipelines
- Custom access policies (Public / Private / Embargoed)
- Controlled cross-tenant data sharing and federated queries

[Learn about the Tenant Model →](tenant-model.md)

---

## Key BER Programs Supported

K-BERDL currently serves or is onboarding the following programs as tenants:

- **KBase** — Narrative-driven computational biology and workflow execution
- **JGI** — Genomics and metagenomics data from the Joint Genome Institute
- **NMDC** — National Microbiome Data Collaborative metadata and workflows
- **EMSL** — Environmental Molecular Sciences Laboratory multi-omics data
- **ESS-DIVE** — Environmental Systems Science Data Infrastructure for a Virtual Ecosystem
- **ARM** — Atmospheric Radiation Measurement climate research data

---

## Roadmap Highlights

| Phase | Focus |
|---|---|
| **Q1 2025** | Core platform launch, DTS ingestion, JGI & NMDC pilot onboarding |
| **Q2 2025** | Cross-tenant federated queries, BER Public Data Commons |
| **Q3 2025** | AI Agent SDK, automated metadata curation, vector/semantic search |
| **Q4 2025** | Ephemeral SQL warehouses, graph analytics, real-time dashboards |

[View the full Roadmap →](roadmap.md)

---

## Getting Started

Use the navigation to explore:

- [**Architecture**](architecture.md) — Platform design and technical components
- [**Tenant Model**](tenant-model.md) — Multi-tenancy, isolation, and onboarding
- [**Governance & Security**](governance.md) — Access control and data policies
- [**MinIO / Data Plane**](data-plane-minio.md) — Storage layer and Delta Lake integration
- [**Ingestion Guide**](data-ingestion-guide.md) — How to bring data into the Lakehouse
- [**AI Integration**](ai-integration.md) — AI agents, semantic search, and automation
