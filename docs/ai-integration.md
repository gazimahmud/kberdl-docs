# AI Integration

The KBase Data Lakehouse is "AI-Native," meaning it is explicitly designed to support machine learning workflows and automated reasoning agents alongside traditional bioinformatics.

## AI Readiness

Data in the Lakehouse is curated to be Machine Learning ready:
*   **Cleaned & Normalized**: Silver/Gold tables remove common data quality issues.
*   **Vector Embeddings**: Textual descriptions and ontology terms are automatically embedded (e.g., via BioBERT) for semantic search.
*   **Knowledge Graph**: Relationships between entities (Gene -> Protein -> Pathway) are materialized for graph neural networks.

## Agentic Frameworks

Users can deploy AI Agents to interact with the data:

### 1. Analysis Copilots
Interactive agents that help users write KBase Narrative scripts, suggest parameters for tools, and interpret error messages.

### 2. Autonomous Reasoners
Background agents that scan the Lakehouse for new data patterns.
*   *Example*: An agent that watches for new genomes and automatically attempts to classify biosynthetic gene clusters (BGCs).

## Model Training

The platform exposes standardized interfaces for training models:

*   **Ray on Kubernetes**: Distributed training support for PyTorch and TensorFlow.
*   **Feature Store**: A centralized repository of ML features (e.g., "Gene GC content", "Expression Levels") ensuring reproducibility across training runs.

```python
# Example: Fetching a training dataset
from kbase.lakehouse import FeatureStore

fs = FeatureStore()
training_data = fs.get_dataset(
    name="microbial_growth_conditions",
    version="v2.1"
)
```
