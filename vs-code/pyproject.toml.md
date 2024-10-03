---
description: hoja con librerías
---

# Pyproject.toml

Paquetes que añadí manualmente

```toml
reportlab = "^3.6.12"
requests-toolbelt = "^0.10.1"
grpcio-tools = "^1.62.3"
protobuf = "^4.25.4"
grpcio = "^1.66.1"
boto3 = "^1.35.17"
requests = "^2.32.3"
requests-toolbelt = "0.10.1"
sentence-transformers = "^2.2.2" 
langchain-groq = "0.1.9" #ya lo añadimos en Groq
```

Para que poetry esté al día con pyproject

```
poetry install
```

Si quiero actualizar todo (no recomendable..)

```
poetry update
```
