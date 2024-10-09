# 🐋 Empezar Docker

Si hago este comando

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml up
```

{% hint style="warning" %}
Me va a salir "error login" porque el backend y el frontend se crean manualmente no descarga la imagen.&#x20;
{% endhint %}

El primer comando es crear la imagen de traefik:

```
docker compose -f docker-compose.traefik.yml up -d
```

Compruebo que ya tengo la imagen de traefik creada:

```
docker image ps
```

Inicio el backend:

<pre data-line-numbers><code><strong> cd backend
</strong> docker build -t backend .  #sin el punto no funciona
</code></pre>

Luego el frontend:

{% code lineNumbers="true" %}
```
cd frontend
docker build -t frontend .
```
{% endcode %}

Los comandos para arrancar la creación de los contenedores

Y para empezar los contenedores

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml up -d
```

```bash
sudo docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d
```
