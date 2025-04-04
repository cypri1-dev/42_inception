##
<h1 align="center">
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/refs/heads/main/badges/inceptione.png" alt="Inception Badge">
</h1>

## 📌 Description

**Inception** is a system administration project aimed at setting up a secure and modular web infrastructure using Docker and Docker Compose.  
You will configure an environment that includes **NGINX**, **WordPress**, and **MariaDB**, while strictly following best practices for containerization and security.

## 🎯 Objectives

- Learn how to configure and orchestrate Docker containers.
- Understand secure deployment practices.
- Use Docker Compose to define multi-container environments.
- Store persistent data using Docker volumes.
- Manage environment variables and secrets securely.

## 🛠️ Services & Requirements

Each service must be in its own container and built from either the penultimate stable version of **Alpine** or **Debian**.

| Service       | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| **NGINX**     | Acts as the only entrypoint (port 443), with TLSv1.2 or TLSv1.3 enabled.    |
| **WordPress** | PHP-FPM based setup, served behind NGINX. No NGINX inside this container.   |
| **MariaDB**   | Stores the WordPress database. No NGINX inside this container.              |

### ✅ Mandatory Rules

- Must be deployed inside a **Virtual Machine** (using here debian **11.11.0**).
- Use **Docker Compose** to build and run services.
- Containers must restart automatically on failure.
- Each Dockerfile must be written manually. No pre-built images allowed (except Alpine/Debian).
- Do **not** use `tail -f`, `sleep infinity`, or any kind of infinite loops.
- Network must be explicitly defined in `docker-compose.yml`.
- NGINX must be the only exposed container, accessible **only via HTTPS (443)**.

## 🔐 Security & Environment

- Use a `.env` file to manage environment variables like domain name, database credentials, etc.
- Store sensitive data such as passwords in the `secrets/` folder.
- Never commit credentials to Git.

## Domain Setup

Update your /etc/hosts (Linux/macOS) or C:\Windows\System32\drivers\etc\hosts (Windows) to map your domain:
```bash
127.0.0.1  yourlogin.42.fr
```

## 🧹 Clean Code & Git

- Never push .env or secrets/ files to your repository.
