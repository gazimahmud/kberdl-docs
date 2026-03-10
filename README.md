# KBase BER Data Lakehouse Documentation

This repository contains the source documentation for the **KBase BER Data Lakehouse (K-BERDL)** — a unified, AI-native data platform for DOE Biological and Environmental Research.

## About K-BERDL

The KBase BER Data Lakehouse integrates heterogeneous biological and environmental datasets from across the DOE BER ecosystem (JGI, NMDC, EMSL, ESS-DIVE, ARM, and others) into a single, governed, FAIR-compliant infrastructure. It provides multi-tenant data isolation, scalable storage and compute, end-to-end data lineage, and AI-native workflows to support discovery and cross-program collaboration at scale.

## Documentation Topics

- **Architecture** — Platform design, compute/storage layers, and technical components
- **Tenant Model** — Multi-tenancy, data isolation, and BER program onboarding
- **Governance & Security** — Access control, data policies, and FAIR compliance
- **K-BERDL Data Ingestion** — Ingestion methods, supported formats, and data tiers
- **MinIO / Data Plane** — Object storage and Delta Lake integration
- **AI Integration** — AI agents, semantic search, and automated workflows
- **Roadmap** — Platform development timeline and upcoming capabilities

## Built With

- [Zensical](https://zensical.io) — Documentation site generator
- [MkDocs Material Theme](https://squidfunk.github.io/mkdocs-material/) — UI theme

## Running Locally

Requires [Docker](https://www.docker.com/).

```bash
docker compose up --build
```

The documentation site will be available at `http://localhost:8000`.
