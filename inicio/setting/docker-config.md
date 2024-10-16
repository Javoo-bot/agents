---
description: iniciar docker
---

# 🛠️ Docker config

Instalar docker desktop

```powershell
Start-Process "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
```

Instalar docker desktop y habilita Windows Subsystem for Linux **(WSL 2)**

Necesitamos WSL 2 (kernel de linux)&#x20;

```powershell
# habilitar WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# habilitar la plataforma de máquina virtual (necesaria para WSL 2)
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

```

Poner WSL como predeterminado

```powershell
wsl --set-default-version 2
```

¿Está todo bien instalado? Vamos a verlo

```powershell
docker --version
```

Si todo va bien, ¡prueba esto!

```powershell
docker run hello-world
```

Ya que estamos vamos a ver si los multicontenedores estan okey

```powershell
docker-compose --version
```
