# K-BERDL Data Ingestion

**Bringing biological and environmental data into the K-BERDL platform**

The K-BERDL platform supports flexible, scalable data ingestion for diverse scientific data types — from terabyte-scale genomic archives to real-time instrument streams. Data flows through a structured Bronze → Silver → Gold pipeline that progressively refines raw inputs into analysis-ready, governed datasets.

---

## Ingestion Methods

### KBase Data Transfer Server (DTS)

The primary method for high-volume ingestion. DTS is optimized for large-scale, reliable transfers over high-latency networks.

- **Parallel multi-stream transfers** to maximize throughput
- **Automatic checkpointing** — interrupted transfers resume where they left off
- **Integrity verification** via MD5/SHA256 checksums on arrival
- **Pipeline triggering** — downstream processing starts automatically upon successful ingest

```bash
# Authenticate
kbase-dts auth login

# Upload a directory to a tenant bucket
kbase-dts cp -r /path/to/local/data dts://my-bucket/project-123/
```

---

### Batch Ingestion

Suitable for facility outputs, historical datasets, and large file archives. Batch jobs are submitted through the platform's ingestion API or the DTS CLI and processed asynchronously.

Supported triggers:

- Manual submission via CLI or API
- Scheduled jobs (cron-based)
- Facility pipeline handoffs (JGI, EMSL, ESS-DIVE)

---

### Streaming Ingestion

For real-time or near-real-time data (e.g., instrument sensors, event feeds), K-BERDL provides a Kafka ingress endpoint. Streamed records are automatically compacted into Delta tables hourly.

```json
{
  "topic": "instrument-readings",
  "payload": {
    "sensor_id": "temp-34",
    "value": 23.5,
    "timestamp": "2024-10-24T10:00:00Z"
  }
}
```

---

### Event-Driven Ingestion

Ingestion can be triggered automatically by:

- KBase Narrative workflows
- AI agent task completions
- External API events (JGI, NMDC, EMSL)
- Object storage PUT events (MinIO notifications)

---

## Supported Data Formats

Bronze-to-Silver parsing pipelines are available for the following formats:

| Domain | Formats |
|---|---|
| **Genomics** | FASTA, FASTQ, BAM, CRAM, VCF, GFF3 |
| **Metagenomics** | BIOM, Sequence Read Archives (SRA) |
| **Mass Spectrometry** | mzML, mzXML |
| **Environmental** | CSV, NetCDF, GeoTIFF |
| **General** | Parquet, JSON, TSV, Delta |

---

## Data Tiers

All ingested data moves through three structured tiers:

| Tier | Description |
|---|---|
| **Bronze** | Raw, unmodified source data. Preserved for reproducibility and audit. |
| **Silver** | Cleaned, validated, and schema-normalized. Ready for analysis. |
| **Gold** | Aggregated, enriched, and curated. Optimized for cross-program queries and AI workflows. |

Transformations between tiers are logged in the lineage catalog, ensuring full provenance tracking from source to output.

---

## Tenant Ingestion Policies

Each tenant controls its own ingestion configuration:

- **Access policies** — Public, Private, or Embargoed on a per-dataset basis
- **Schema definitions** — Tenants define their own metadata models and table schemas
- **Approval workflows** — Data stewards can require review before Silver/Gold promotion
- **Cross-tenant visibility** — Tenants explicitly opt datasets into the shared BER Data Commons

[Learn more about the Tenant Model →](tenant-model.md)

---

## Related Resources

- [Architecture Overview](architecture.md) — How the data plane and compute layers are structured
- [MinIO / Data Plane](data-plane-minio.md) — Underlying object storage and Delta Lake details
- [Governance & Security](governance.md) — Access control and data policies
