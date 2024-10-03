# ♻️ Crear environment

## 2 opciones enviroment

* En la consola

{% code lineNumbers="true" %}
```powershell
cd ruta/donde/quiero/venv

# Crear un entorno virtual en la carpeta 'venv'
python -m venv venv

# Activar el entorno virtual (si usaste `venv`)
.\venv\Scripts\Activate
```
{% endcode %}

* En Anaconda Navigator

<pre class="language-powershell" data-line-numbers><code class="lang-powershell"><strong># Ver entornos de conda 
</strong><strong>conda env list
</strong><strong>
</strong><strong># Ver que version de python y crear entorno:
</strong>python --version

 #creo entorno
conda create --name myenv python=3.11.7
</code></pre>
