# 🐋 Empezar Docker

Este codigo solo funciona la primera vez

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml up
```

Los comandos para arrancar la creación de los contenedores

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml build --no-cache
```

Y para empezar los contenedores

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml up -d
```
