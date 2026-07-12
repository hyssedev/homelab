# Homelab

Infrastructure-as-code for my self-hosted homelab: Docker Compose stacks, reverse-proxy
configuration, and supporting configs — versioned so I can track my own progress and rebuild
things from scratch when needed.

## Overview

Everything is fronted by a single **HAProxy** instance that terminates TLS, applies security
headers and rate limiting, and routes to backend services. Authentication for protected apps is
handled by [tinyauth](https://github.com/steveiliop56/tinyauth) via HAProxy's forward-auth
(`auth-request.lua`) — HAProxy verifies each request with tinyauth before proxying it upstream.

```
                        ┌──────────────┐
   Client ── :80  ──▶   │              │  :80 → 301 redirect to HTTPS
           :443  ──▶    │   HAProxy    │  TLS termination, security headers,
                        │              │  rate limiting, forward-auth
                        └──────┬───────┘
                               │
          ┌────────────────────┼─────────────────────┐
          ▼                    ▼                     ▼
     chrs.ro (SWS)         tinyauth              Grafana
     static site        forward-auth /       protected — verified
     — public —          login page          via tinyauth
```

## Services

| Host                          | Backend              | Auth                   | Notes                          |
| ----------------------------- | -------------------- | ---------------------- | ------------------------------ |
| `chrs.ro`, `www.chrs.ro`      | SWS static @ `:8080` | public                 | Personal site      |
| `auth.internal.chrs.ro`       | tinyauth @ `:3000`   | public                 | Login + forward-auth provider  |
| `grafana.internal.chrs.ro`    | Grafana              | tinyauth forward-auth  | Metrics dashboards             |

## Repository layout

```
.
├── README.md
├── .gitignore
├── haproxy.cfg          # reverse proxy config
└── stacks/              # docker compose stacks & service configs
```

## License

Personal project — no warranty.
