---
description: fichero tarjetas
---

# 🤑 Hades

Importamos de Hermes el código que nos ayuda a que los logs salgan en el formato que nos interesa

```python
from app.core.graph.skills.hermes import DictLogHandler
```

Y de mercurio nos quedamos con un par de funciones

```python
from app.core.graph.skills.mercurio import analyze_csv_security, 
                                           create_findings_pdf, 
                                           upload_to_app  # asi evito tener que copiarlas
```

Luego vamos al bucket de S3 y queremos hacer 3 cosas:

* Conectarnos usando la clase
* Obtener el fichero más reciente
* Almacenar una copia temporal del archivo (buffer)

#### Construir la habilidad usando `@tool`

Creamos un diccionario que almacene lo que queremos que devuelva la app como en `Mercurio` o `Hermes`

```python
 result = {"status": "success", 
           "file_path": file_path, 
           "metadata": None, 
           "logs": [], 
           "errors": []
           }
```

#### Incluimos los valores en s3\_client

Buscamos el fichero mas reciente

```python
recent_file = s3_client.find_most_recent_file(
              bucket_name, 
              folder_path, 
              file_prefix, 
              days_to_check
              )
```

Almacenamos la ruta del archivo para investigar después

```python
file_path = recent_file["file_path"]
file_content = s3_client.get_s3_object(
               bucket_name, 
               file_path
               )
```

Con el fichero hacemos el informe de ciberseguridad

```python
data_content = file_content.getvalue().decode("utf-8")
analysis_report = analyze_csv_security(data_content, logger)
```

Subimos el fichero a la aplicacion

```python
pdf_buffer = create_findings_pdf(analysis_report)

filename = f"data_analysis_report_{random.randint(1, 1000)}.pdf"

upload_success, upload_result = upload_to_app(
                                 pdf_buffer, 
                                 filename, 
                                 "localhost", 
                                 logger
                                 )
```

Por ultimo y como siempre imprimimos el diccionario en formato JSON

```python
return json.dumps([result])
```
