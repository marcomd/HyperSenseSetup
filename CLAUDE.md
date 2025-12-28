# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context-Aware Documentation

When working on this project, pull the appropriate README into context:
- **Backend work**: Read `backend/README.md` for comprehensive backend documentation
- **Frontend work**: Read `frontend/README.md` for comprehensive frontend documentation

These READMEs are kept up-to-date and contain detailed implementation guides, API documentation, and configuration details.

## Development Standards

**ALWAYS follow these practices:**
- Use Ruby on Rails 8.1 best practices
- Apply TDD (Test-Driven Development) - write tests first
- Release atomic commits (complete work: code + tests together)
- Ensure RuboCop passes before considering work complete (backend)
- Ensure ESLint passes before considering work complete (frontend)
- Increase the version number in this way (if a fix increase the patch else the minor for features):
  - on the backend the VERSION is in config/application.rb and on the README
  - on the frontend the VERSION is in package.json and on the README
- Add the version entry on the CHANGELOG.md
- Update README.md at the end of each implementation with the change

## Commands

### Backend Commands

All commands run from `backend/` directory:

```bash
# Setup
bundle install                    # Install gems
docker compose up -d              # Start PostgreSQL (from project root)
rails db:create db:migrate        # Setup database
cp .env.example .env              # Configure environment variables

# Development
bin/dev                           # Start Rails server (port 3000)
bin/jobs                          # Start Solid Queue workers

# Testing
rspec                             # Run all tests
rspec spec/services/              # Run tests in folder
rspec spec/services/indicators/calculator_spec.rb  # Single test file
rspec spec/services/indicators/calculator_spec.rb:42  # Single test at line

# Linting & Security
bin/rubocop                       # Check code style (Omakase Ruby)
bin/rubocop -a                    # Auto-fix style violations
bin/brakeman --no-pager           # Security vulnerability scan
bin/bundler-audit                 # Dependency vulnerability scan
bin/ci                            # Run full CI pipeline locally
```

### Frontend Commands

All commands run from `frontend/` directory:

```bash
# Setup
npm install                       # Install dependencies
npx playwright install chromium   # Install Playwright browser (E2E)

# Development
npm run dev                       # Start Vite dev server (port 5173)

# Build & Lint
npm run build                     # TypeScript check + production build
npm run lint                      # Run ESLint
npm run preview                   # Preview production build

# Unit Testing (Vitest)
npm test                          # Run tests in watch mode
npm run test:ui                   # Run tests with UI
npm run test:run                  # Run tests once (CI mode)
npm run test:coverage             # Run tests with coverage report

# E2E Testing (Playwright)
npm run test:e2e                  # Run E2E tests
npm run test:e2e:ui               # Run E2E tests with UI

# All Tests
npm run test:all                  # Run unit + E2E tests
```

## Architecture

HyperSense is an autonomous AI trading agent for cryptocurrency markets using Claude AI for reasoning.

```
┌─────────────────────────────────────────────────────────────┐
│                    REACT DASHBOARD                          │
│                 (Real-time monitoring)                      │
│            WebSocket ◄──► REST API (port 5173)             │
└────────────────┬──────────────────────────────────────────┘
                 │ ActionCable
                 ▼
┌─────────────────────────────────────────────────────────────┐
│                    RAILS API (port 3000)                    │
│              API v1 Controllers + WebSocket                 │
└────────────────┬──────────────────────────────────────────┘
                 │
┌────────────────┴──────────────────────────────────────────┐
│                    ORCHESTRATOR                             │
│              (TradingCycleJob - every 5 min)               │
│                   Via Solid Queue                           │
└────────────────┬──────────────────────────────────────────┘
                 │
        ┌────────┴────────┐
        ▼                 ▼
┌──────────────────┐  ┌──────────────────┐
│  MACRO STRATEGY  │  │  TRADING CYCLE   │
│  (Daily refresh) │  │  (Every 5 min)   │
│  Market narrative│  │  Trade decisions │
│  Bias direction  │  │  Entry/exit pts  │
└────────┬─────────┘  └────────┬─────────┘
         └──────────┬──────────┘
                    ▼
        ┌──────────────────────────┐
        │   DATA INGESTION LAYER   │
        │ PriceFetcher (Binance)   │
        │ SentimentFetcher (F&G)   │
        │ Indicators::Calculator   │
        └──────────────────────────┘
                    ▼
        ┌──────────────────────────┐
        │   MarketSnapshot (PG)    │
        │   Solid Queue (no Redis) │
        └──────────────────────────┘
```

See `backend/README.md` for detailed architecture including Risk Management Layer and execution flow.

### Backend Code Organization

- **Services**: Business logic in `app/services/` organized by domain:
  - `DataIngestion::` - External API fetchers (Binance, Fear & Greed, news, whale alerts)
  - `Indicators::` - Technical analysis (EMA, RSI, MACD, Pivot Points)
  - `Forecasting::` - Prophet ML price predictions
  - `Reasoning::` - LLM agents with weighted context (see `backend/README.md` for context weights)
  - `Execution::` - Trade execution via Hyperliquid
  - `Risk::` - Risk management (position limits, circuit breaker)

- **API Controllers**: REST API in `app/controllers/api/v1/`:
  - `DashboardController` - Aggregated dashboard data
  - `PositionsController` - Open positions, performance/equity curve
  - `DecisionsController` - Trading decisions history
  - `MarketDataController` - Current market data and indicators
  - `MacroStrategiesController` - Macro strategy history

- **WebSocket Channels**: Real-time updates via ActionCable:
  - `DashboardChannel` - Market, position, decision, strategy updates
  - `MarketsChannel` - Price ticker updates per symbol

- **Jobs**: Solid Queue background jobs in `app/jobs/`:
  - `TradingCycleJob` - Main orchestrator (every 5 min)
  - `MacroStrategyJob` - High-level analysis (daily at 6am)
  - `MarketSnapshotJob` - Data collection (every minute)
  - `ForecastJob` - Prophet ML price predictions (every 5 min)
  - `RiskMonitoringJob` - SL/TP monitoring, circuit breaker (every minute)

- **Configuration**:
  - `config/settings.yml` - Trading parameters (assets, risk limits, weighted context)
  - `config/recurring.yml` - Job schedules
  - `config/queue.yml` - Worker configuration
  - `.env` - Environment variables (see Environment Variables section)

### Frontend Code Organization

React dashboard in `frontend/src/`:

- **API**: `api/client.ts` - Typed API client for all endpoints
- **Components**:
  - `components/cards/` - Dashboard cards (AccountSummary, PositionsTable, DecisionLog, etc.)
  - `components/charts/` - Recharts visualizations (EquityCurve)
  - `components/layout/` - Layout components (Header)
- **Hooks**:
  - `hooks/useApi.ts` - React Query hooks for data fetching
  - `hooks/useWebSocket.ts` - ActionCable WebSocket integration
- **Pages**: `pages/Dashboard.tsx` - Main dashboard page
- **Types**: `types/index.ts` - TypeScript type definitions

### Key Patterns

1. **Service Objects**: Keep controllers thin, business logic in services
2. **Solid Queue**: Database-backed job queue (no Redis needed)
3. **Settings Gem**: Access config via `Settings.assets`, `Settings.risk.max_position_size`
4. **VCR Cassettes**: HTTP interactions recorded for tests - tag tests with `:vcr`
5. **JSONB Columns**: Flexible schema for indicators and sentiment data

## Tech Stack

### Backend
- Ruby 3.4.4, Rails 8.1.1 (API mode)
- PostgreSQL 16 (multi-database: primary, cache, queue, cable)
- Solid Queue (database-backed, no Redis)
- ActionCable for WebSocket
- RSpec + VCR for testing
- Omakase Ruby style (rubocop-rails-omakase)

### Frontend
- React 19.2 with TypeScript
- Vite 7.2 for build tooling
- Tailwind CSS 4.1 for styling
- Recharts 3.6 for charting
- TanStack React Query 5.90 for data fetching
- ActionCable for WebSocket connections
- Lucide React for icons
- Vitest + React Testing Library for unit tests
- MSW (Mock Service Worker) for API mocking
- Playwright for E2E tests

## Environment Variables

Configure via `.env` file (copy from `backend/.env.example`):

```bash
# Required: Anthropic API key for AI reasoning
ANTHROPIC_API_KEY=your_anthropic_api_key

# Required: Hyperliquid credentials for trading
HYPERLIQUID_PRIVATE_KEY=your_wallet_private_key
HYPERLIQUID_ADDRESS=your_wallet_address

# Optional: Override default LLM model
LLM_MODEL=claude-sonnet-4-5
```

Settings are accessed via the Config gem (`Settings.anthropic.api_key`, `Settings.llm.model`).
Hyperliquid credentials use direct `ENV.fetch()` for security.

## Implementation Status

**Complete:**
- Foundation (Rails setup, PostgreSQL, Solid Queue)
- Data Pipeline (price/sentiment fetching, indicators)
- Reasoning Engine (macro strategy + trading decision LLM agents)
- Risk Management (position limits, circuit breaker, max drawdown)
- Execution Layer (Hyperliquid integration, paper trading mode)
- React Dashboard (real-time monitoring, WebSocket updates)

**Current Version:** They are indicated in the respective readme
