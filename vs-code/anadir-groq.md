---
description: Usar nueva AP
---

# Añadir Groq

### En

```
frontend\src\components\Members\EditMember.tsx
```

### Añadir en

```typescript
const AVAILABLE_MODELS = {
  openai: ["gpt-4o-mini",
           "gpt-4o",
           "gpt-4-turbo",
           "gpt-3.5-turbo"
           ],
```

### Esto

```typescript
const AVAILABLE_MODELS = {
  openai: ["gpt-4o-mini",
           "gpt-4o",
           "gpt-4-turbo",
           "gpt-3.5-turbo",
           "model_name" #ESTE ES EL NUEVO!!
           ],
```

### En&#x20;

```python
class BaseNode:
    def __init__(
        self, provider: str, model: str, base_url: str | None, temperature: float
    ):
        if provider in ["openai"] and base_url: #AQUI!!!!
            self.model = init_chat_model(
                model,
                model_provider=provider,
                temperature=temperature,
                base_url=base_url    )

```

Añadir `open_api_key`

```python
class BaseNode:
    def __init__(
        self, provider: str, model: str, base_url: str | None, temperature: float
    ):
        if provider in ["openai", "groq"] and base_url:
            self.model = init_chat_model(
                model,
                model_provider=provider,
                temperature=temperature,
                openai_api_key=os.getenv("GROQ_API_KEY") if provider == "groq" else None,
                base_url=base_url       )

```

En:

```
backend\pyproject.toml
```

Añadir

```toml
langchain-groq = "0.1.9"
```
