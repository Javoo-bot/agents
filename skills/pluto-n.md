# 🐶 Pluto(n)

Creamos `DictLogHandler` para que los logs generen un mensaje como nosotros queremos.

Usamos la función `luhn` para verificar que el numero de tarjeta  es valido

Si la tarjeta es valida comprobamos el tipo de tarjeta.

Luego vamos al bucket de S3 y queremos hacer 3 cosas:

* Conectarnos al bucket&#x20;
* Almacenar una copia temporal del archivo (buffer)

Buscamos dentro del contenido del archivo si hay alguna cadena de texto que contenga los números de la tarjeta.&#x20;

Luego si hay alguna cadena que contenga los números de la tarjeta también se considera como un candidato para match.&#x20;

#### Construir la habilidad usando `@tool`

Creamos un diccionario que almacene lo que queremos que devuelva la app.

```python
result = {
        "card_type": "UNKNOWN",
        "s3_content_search_result": None,
        "logs": [],
        "errors": []
    }
```

#### Incluimos los valores en s3\_client

Validamos la tarjeta de crédito:

* Si es una tarjeta VISA, MasterCard..
* Obtenemos el archivo como una copia temporal
* Analizamos el contenido
* Vemos si el numero de tarjeta del cliente está en el fichero

Por ultimo imprimimos el diccionario en formato JSON

<pre class="language-python"><code class="lang-python"><strong>return json.dumps([result])
</strong></code></pre>
