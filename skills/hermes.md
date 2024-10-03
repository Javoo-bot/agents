---
description: metadatos
icon: caduceus
---

# Hermes

Como la aplicación dio tantos problemas 'JSON format' pues hubo que crear una función para gestionar las fechas en un formato JSON.

Si el objeto es de tipo `datatime` entonces lo convertimos en ISO

Si el objeto no es `datatime` entonces lo manejamos con el método `default`&#x20;

```python
class DateTimeEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.isoformat()
        return super().default(obj)
```

Luego creemos una nueva clase para extender la funcionalidad de la clase `logging.Handler` y así los logs siguen el formato records.&#x20;

```python
log_entry = {"level": record.levelname, "message": self.format(record)}
```

Luego vamos al bucket de S3 y queremos hacer 2 cosas:

* Conectarnos usando la clase
* Obtener los metadatos de un fichero: tamaño, tipo fichero, ultima modificación, etc...

#### Construir la habilidad usando `@tool`

Creamos un diccionario que almacene lo que queremos que devuelva la app

```python
 result = {"status": "success", 
           "file_path": file_path, 
           "metadata": None, 
           "logs": [], 
           "errors": []
           }
```

Ponemos los logs por si algo falla que me avise y volvemos a escribir toda la lógica de antes.

Incluimos los valores en s3\_client:

```python
s3_client = S3Client(
        access_key="llave_acceso",
        secret_key="llave_secreta",
        endpoint_url="https://url_de_bucket.com",
        region_name="region"
        )
```

Ahora para que el agente almacene los metadatos

```python
metadata = s3_client.get_object_metadata(
           bucket_name, 
           file_path
           )
```

Al final resulta que da menos errores si formateamos todo en Json

```python
return json.dumps([result], cls= DateTimeEncoder)
```
