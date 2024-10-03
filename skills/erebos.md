---
description: no nos conectamos bucket
icon: skull-crossbones
---

# Erebos

Importamos de `Hermes` el código que nos ayuda a que los logs salgan en el formato que nos interesa

```python
from app.core.graph.skills.hermes import DateTimeEncoder, DictLogHandler
```

#### Modelo groq

Cargamos el modelo de Groq para hacer el informe

```python
groq_client = ChatGroq(
              api_key="api_key", 
              model_name="nombre_modelo"
              )
```

Comprobamos si el email esta en filtraciones de bases de datos

```python
def check_email_breach(email: str) -> Dict[str, Any]:
    url = f"https://api.xposedornot.com/v1/breach-analytics?email={email}"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        return {
            "status": "success",
            "message": f"Success for {email}.",
            "data": data
        }
    else:
        return {"status": "error"}
```

Tenemos que limitar los datos que me da la Api porque son demasiados largos.

Es decir el LLM lee hasta los 4000 characteres y nada más.

```python
def truncate_data(data: str, max_length: int = 4000) -> str:  
    if len(data) > max_length:
        return data[:max_length] + "... (truncated)" 
    return data
```

Creamos un informe a partir del resumen de las filtraciones

```python
def summarize_breach_data(data: Dict[str, Any]) -> str:
    prompt = ChatPromptTemplate.from_template(  # tengo que añadir esa clase para añadir todos esos mensajes
        "Summarize the key insights from this breach data: {data}"
    )
    truncated_data = truncate_data(str(data))

    summary_chain = prompt | groq_client  cionarios
    content = summary_chain.invoke({
          "data": truncated_data
    }) 
    return content
```

Como quiero tener una lista de las webs con filtraciones de datos creo una lista a partir del resultado anterior.

La lista es compleja porque es un diccionario con 'key':string y 'value':lista y los elementos de la lista es un diccionario con varios key-value.

```python
def get_breaches_summary(data: Dict[str, Any]) -> str:
    """Extract a list of breaches from the data and format as a comma-separated string."""
    breaches = []
    if (
        "ExposedBreaches" in data and "breaches_details" in data["ExposedBreaches"]
    ):  
        for breach in data["ExposedBreaches"]["breaches_details"]:
            if isinstance(breach, dict) and "breach" in breach:
                breaches.append(breach["breach"])  # la manera mas rapida es almacenar resultados en lista
    return ", ".join(breaches)
```

Seguimos la misma lógica que en `Mercurio` y:

* Creamos PDF con los hallazgos
* Subimos a la aplicación&#x20;

#### Construir la habilidad usando `@tool`

Creamos un diccionario que almacene lo que queremos que devuelva la app.

<pre><code><strong>breach_data = check_email_breach(email)
</strong></code></pre>

Nos quedamos con el resumen y la lista filtraciones de bases de datos.&#x20;

```python
result["summary"] = summarize_breach_data(breach_data["data"])

result["breaches_list"] = get_breaches_summary(breach_data["data"])
```

Creamos el pdf y lo subimos a la aplicacion.&#x20;

```python
pdf_buffer = create_findings_pdf(result["summary"], result["breaches_list"])

filename = f"email_breach_report_{random.randint(1, 1000)}.pdf"
```

Por ultimo imprimimos el diccionario en formato JSON

<pre class="language-python"><code class="lang-python"><strong>return json.dumps([result])
</strong></code></pre>
