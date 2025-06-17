# 🚀 NGINX Open Source Lightweight API Gateway Using Lua

This repository contains a fully functional, lightweight API Gateway implementation using **NGINX Open Source** and **Lua**, enhanced with OpenAPI validation, Redis-based rate limiting, Prometheus monitoring, Swagger UI, and Docker support.

---

## 📦 Features

- ✅ **JWT Authentication**
- ⚙️ **Rate Limiting** (via Redis)
- 🔍 **OpenAPI Request Validation**
- 🔁 **Request Transformation**
- 📄 **Structured Logging**
- 🌐 **CORS Support**
- 📊 **Prometheus Metrics**
- 📘 **Swagger UI**
- 🐳 **Docker + Docker Compose**

---

## 🗂️ Project Structure

```bash
.
├── conf
│   └── lua
│       ├── auth.lua                 # JWT token validation
│       ├── rate_limit_redis.lua    # Redis-based rate limiting
│       ├── request_transform.lua   # Adds audit info to request body
│       ├── openapi_validator.lua   # Simple OpenAPI request checks
│       ├── prometheus.lua          # Request counting + latency metrics
│       ├── cors.lua                # CORS preflight and headers
│       └── logger.lua              # Logs request metadata
├── swagger
│   ├── index.html                  # Swagger UI
│   └── openapi.json                # API specification
├── nginx.conf                      # Main NGINX config
├── Dockerfile                      # Container build
├── docker-compose.yml             # Redis + Gateway orchestration

---

## 🚀 Getting Started
### Prerequisites
- Docker
- Docker Compose

### Run the API Gateway
```
  docker-compose up --build
```

---

### Available Services
| Component	| URL |
| --------------- | ----- |
| API Gateway	| http://localhost:8080 |
| Swagger UI	| http://localhost:8081/swagger/ |
| Prometheus Metrics |	http://localhost:8080/metrics |
| Redis	| localhost:6379 |

---

## 🧪 Sample Test
```
  curl -X POST http://localhost:8080/api/users \
    -H "Authorization: Bearer <your_token>" \
    -H "Content-Type: application/json" \
    -d '{"name": "Alice", "email": "alice@example.com"}'
```

---

## 📊 Prometheus Metrics
nginx_http_requests_total

nginx_http_request_duration_seconds

Use these metrics in Prometheus or Grafana for observability.

---

## 🧠 Notes
Requires a valid JWT token signed with the secret "your-secret" for authentication.

The rate limiter allows 100 requests per IP per minute (via Redis).

OpenAPI validation is a mock implementation; for full support, integrate with Lua FFI and a proper OpenAPI engine.

---

## 🛡️ Security
HTTPS is not enabled by default — use a reverse proxy or add certs in nginx.conf.

Modify auth.lua for real-world token verification (e.g., with RSA or public JWK).

---

## ✨ Author
Built by Sudarshan Narayanan — feel free to fork and adapt.

## 🙌 Contributions Welcome!
PRs, bug reports, and feature requests are welcome to improve this gateway further.
