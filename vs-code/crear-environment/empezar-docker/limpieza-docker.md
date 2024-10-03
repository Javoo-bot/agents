---
description: comandos útiles
---

# Limpieza docker

```powershell
# Stop all running containers
docker compose -f docker-compose.yml -f docker-compose.local.yml down

# Remove containers and associated volumes
docker compose -f docker-compose.yml -f docker-compose.local.yml down -v

# Clean up before starting
#docker system prune -f

# Prune unused volumes
docker volume prune 

# Prune all unused volumes
#docker volume prune -f

# Remove all unused images (not just dangling ones)
#docker image prune -a -f

# Clear build cache
#docker image prune -a -f

# Verify that volumes have been removed
docker volume ls
```
