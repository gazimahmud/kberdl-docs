# Data Ingestion Guide

The KBase Data Lakehouse supports multiple mechanisms for ingesting biological and environmental data, ranging from terabyte-scale batch transfers to real-time event streams.

## KBase Data Transfer Server (DTS)

The primary method for high-volume data ingestion is the KBase Data Transfer Server (DTS). DTS is optimized for reliability and performance over high-latency networks.

### Features
*   **Parallel Transfer**: Utilizes multiple streams to maximize bandwidth usage (similar to Globus).
*   **Checkpointing**: Automatically resumes interrupted transfers.
*   **Integrity Verification**: Automatic checksum calculation (MD5/SHA256) upon arrival.

### Quick Start
To initiate a transfer using the CLI:
```bash
# Authenticate
kbase-dts auth login

# Upload a directory
kbase-dts cp -r /path/to/local/data dts://my-bucket/project-123/
```

## Supported Data Formats

The Lakehouse is designed to handle common bio-formats. Automatic "Bronze-to-Silver" parsing pipelines are available for:

*   **Genomics**: FASTA, FASTQ, BAM, CRAM, VCF, GFF3
*   **Metagenomics**: BIOM, Sequence Read Archives
*   **Mass Spectrometry**: mzML, mzXML
*   **Environmental**: CSV, NetCDF, GeoTIFF

## Streaming Ingestion

For real-time data collection (e.g., from instrument sensors), use the Kafka ingress endpoint:

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
Streamed data is automatically compacted into Delta tables hourly.
