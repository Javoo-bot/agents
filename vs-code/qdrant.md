---
description: cambios en los chunks
---

# Qdrant

En&#x20;

```
backend\app\core\graph\rag\qdrant.py
```

Añadir en `class QdrantStore`

```python
chunk_size: int = 20,
chunk_overlap: int = 1
```

En la `def update`&#x20;

```python
chunk_size: int = 20,
chunk_overlap: int = 1
```

Para visualizar resultados en la App

Enlace

{% embed url="http://qdrant.localhost/dashboard" %}

Si queremos ver los documentos que vamos subiendo

Vamos a collections y ahí a Visualize

```clike
{
  "limit": 500,
  "color_by": "upload_id",
  "vector_name": "fast-nomic-embed-text-v1.5-q",
  "algorithm": "TSNE"
}
```
