---
description: informe
icon: mercury
---

# Mercurio

Analiza un fichero CSV, crea un fichero PDF y lo subo a la aplicación.&#x20;

Importamos de Plutón el código que nos ayuda a que los logs salgan en el formato que nos interesa.

```python
from app.core.graph.skills.pluton import DictLogHandler
```

#### Modelo groq

Cargamos el modelo de Groq para hacer el informe

```python
groq_client = ChatGroq(
              api_key="api_key", 
              model_name="nombre_modelo"
              )
```

#### Creamos la clase S3&#x20;

Al crear la clase es más fácil reutilizar el código en el futuro.&#x20;

&#x20;Esta clase S3 hace dos cosas:

* Se conecta al bucket S3 usando las claves que me dio el administrador (César)
* Coge el archivo y no lo descarga porque tarda mucho! Entonces lo almacena en buffer (memoria temporal)

Luego con el archivo ya cargado en memoria vamos a analizarlo.

#### Informe

Para analizarlo tenemos que usar el esquema que nos da Groq para usar su LLM.

Como estamos usando una Api pequeña limitamos el modelo hasta los 1000 tokens.

#### Archivo PDF&#x20;

Creamos un PDF usando la librería `reportlab` y básicamente:

```python
pdf.build(content)
```

#### Para subir a la aplicación los documentos

Pedimos el token a la API

Calculamos el tamaño del archivo porque sino la app me lo rechaza

Hay que mandar el `data`a la api usando `MultipartEncoder`&#x20;

#### Construir la habilidad usando `@tool`

Creamos un diccionario con lo que queremos que salga por pantalla al chatear con el LLM.

```python
 result = {"status": "success", 
           "file_path": file_path, 
           "analysis_result": None, 
           "logs": [], 
           "errors": []
           }
```

Añadimos los valores en el cliente S3 para que la app pueda entrar en el bucket, ¡sino se le cierra la puerta!

```
s3_client = S3Client(
        access_key="llave_acceso",
        secret_key="llave_secreta",
        endpoint_url="https://url_de_bucket.com",
        region_name="region"
        )
```

Ponemos los logs por si algo falla que me avise y volvemos a escribir toda la lógica de antes.

```python
file_content = s3_client.get_s3_object(bucket_name, file_path)
```

Le pasamos el contenido del archivo del bucket en formato CSV. El LLM analiza la información con analyze\_csv\_security y hace el informe. &#x20;

<pre class="language-python"><code class="lang-python"># Perform cybersecurity analysis
csv_content = file_content.getvalue().decode("utf-8")

<strong>#ponemos logger para que se imprima por la pantalla de la app
</strong>key_findings = analyze_csv_security(csv_content, logger)
</code></pre>

Se pasa el informe a un formato PDF. Y lo subimos con un nombre diferente cada vez. &#x20;

<pre class="language-python"><code class="lang-python">pdf_buffer = create_findings_pdf(key_findings)
<strong>
</strong><strong>filename = f"security_findings_{random.randint(1, 1000)}.pdf"  
</strong>
upload_success, upload_result = upload_to_app(pdf_buffer, filename, "localhost", logger)
</code></pre>

Al final resulta que da menos errores si formateamos todo en Json

```
return json.dumps([result])
```
