# HyperSense

Autonomous AI trading agent for cryptocurrency markets using LLM reasoning (supports Anthropic, Gemini, Ollama, OpenAI).

## Quick Start with Docker

Run the full stack with a single command:

```bash
# 1. Clone the repository
git clone https://github.com/marcomd/HyperSenseSetup.git
cd HyperSense

# TBD

# 2. Configure environment
cp .env.docker.example .env
# Edit .env with your configuration (see below)

# 3. Build and start all services
docker compose up -d --build

# 4. Access the dashboard
open http://localhost
```

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and Docker Compose

## Environment Configuration

Copy `.env.docker.example` to `.env` and configure:

### Required Variables

| Variable | Description | How to get it |
|----------|-------------|---------------|
| `RAILS_MASTER_KEY` | Decrypts Rails credentials | Copy from `backend/config/master.key` |
| `POSTGRES_PASSWORD` | Database password | Choose a secure password |
| `LLM_PROVIDER` | AI provider (`anthropic`, `gemini`, `ollama`, `openai`) | Choose one |
| `ANTHROPIC_API_KEY` | Anthropic API key (if using Anthropic) | [console.anthropic.com](https://console.anthropic.com/) |

### Optional Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `GEMINI_API_KEY` | - | Google Gemini API key |
| `OPENAI_API_KEY` | - | OpenAI API key |
| `OLLAMA_API_BASE` | - | Ollama API URL (e.g., `http://host.docker.internal:11434/v1`) |
| `HYPERLIQUID_PRIVATE_KEY` | - | Wallet private key for live trading |
| `HYPERLIQUID_ADDRESS` | - | Wallet address for live trading |
| `MISSION_CONTROL_USER` | `admin` | Jobs dashboard username |
| `MISSION_CONTROL_PASSWORD` | - | Jobs dashboard password |
| `JOB_CONCURRENCY` | `2` | Number of background job workers |
| `FRONTEND_PORT` | `80` | Port to access the dashboard |

## Architecture

```
┌─────────────────────────────────────────┐
│         http://localhost                │
│         (Frontend - Nginx)              │
│         Port 80                         │
└─────────────┬───────────────────────────┘
              │ /api/* and /cable
              ▼
┌─────────────────────────────────────────┐
│         Backend (Rails + Thruster)      │
│         Internal port 80                │
└─────────────┬───────────────────────────┘
              │
      ┌───────┴───────┐
      ▼               ▼
┌───────────┐   ┌───────────┐
│  Worker   │   │ PostgreSQL│
│  (Solid   │   │    16     │
│   Queue)  │   │           │
└───────────┘   └───────────┘
```

**Services:**

| Service | Description |
|---------|-------------|
| `db` | PostgreSQL 16 with multi-database setup (primary, cache, queue, cable) |
| `backend` | Rails API server via Thruster |
| `worker` | Solid Queue background jobs (trading cycles, market data, forecasts) |
| `frontend` | React dashboard served by Nginx with API/WebSocket proxy |

## Docker Commands

### Start/Stop

```bash
# Start all services
docker compose up -d

# Start with rebuild
docker compose up -d --build

# Stop all services
docker compose down

# Stop and remove volumes (reset database)
docker compose down -v
```

### Logs

```bash
# View all logs
docker compose logs

# Follow logs in real-time
docker compose logs -f

# View specific service logs
docker compose logs backend
docker compose logs worker
docker compose logs frontend
```

### Service Management

```bash
# Check service status
docker compose ps

# Restart a service
docker compose restart backend

# Execute command in container
docker compose exec backend ./bin/rails console
docker compose exec backend ./bin/rails db:migrate

# Run one-off command
docker compose run --rm backend ./bin/rails db:seed
```

### Database

```bash
# Access Rails console
docker compose exec backend ./bin/rails console

# Run migrations
docker compose exec backend ./bin/rails db:migrate

# Database console
docker compose exec db psql -U hypersense -d hypersense_production
```

## Development Setup (without Docker)

For local development without Docker, see:
- [Backend README](backend/README.md) - Rails API setup
- [Frontend README](frontend/README.md) - React dashboard setup

### Backend (Rails)

```bash
cd backend
bundle install
cp .env.example .env
# Edit .env with your configuration

# Start PostgreSQL (requires Docker for database only)
docker compose up -d

# Setup database
rails db:create db:migrate

# Start server
bin/dev          # Rails server on port 3000
bin/jobs         # Background jobs (separate terminal)
```

### Frontend (React)

```bash
cd frontend
npm install
npm run dev      # Vite dev server on port 5173
```

Access:
- Frontend: http://localhost:5173
- Backend API: http://localhost:3000/api/v1

## Endpoints

| Endpoint | Description |
|----------|-------------|
| `http://localhost` | Dashboard (Docker) |
| `http://localhost/api/v1/health` | API health check |
| `http://localhost/jobs` | Mission Control (Solid Queue dashboard) |
| `http://localhost/up` | Rails health check |

## Troubleshooting

### Services not starting

```bash
# Check service health
docker compose ps

# View startup logs
docker compose logs backend --tail=50
```

### Database connection issues

```bash
# Verify database is healthy
docker compose exec db pg_isready -U hypersense

# Check database logs
docker compose logs db
```

### Frontend not loading

```bash
# Check nginx logs
docker compose logs frontend

# Verify backend is accessible
docker compose exec frontend wget -qO- http://backend/up
```

### Reset everything

```bash
# Stop all services and remove volumes
docker compose down -v

# Rebuild from scratch
docker compose up -d --build
```

## License

MIT
