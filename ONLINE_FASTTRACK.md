# Online Fasttrack

This is the fastest deployment sequence for:
- Frontend on GitHub Pages
- Backend on your server
- Monitor-ready endpoint

## 1) Backend first (server)

```bash
cd /home/masrap/NAKI_PRIMA/NAKI_PRIMA
cp deploy/station.env.example deploy/station.env
nano deploy/station.env
```

Set at minimum:

```bash
STATION_HOST=127.0.0.1
STATION_PORT=5000
STATION_SERVER=waitress
STATION_BASE_URL=https://api-naki.yourdomain.com
STATION_ALLOWED_ORIGINS=https://<username>.github.io
STATION_API_TOKEN=replace-with-strong-token
STATION_DB_PATH=/home/masrap/NAKI_PRIMA/NAKI_PRIMA/wifi_scans.db
```

Start backend:

```bash
./start_station.sh
```

Validate:

```bash
curl -s https://api-naki.yourdomain.com/api/health
curl -s -H "Authorization: Bearer replace-with-strong-token" \
  "https://api-naki.yourdomain.com/api/v1/aoi?format=markas&limit=5"
```

## 2) Reverse proxy (nginx)

Use guide in deploy/DEPLOY_NGINX.md, then verify:

```bash
curl -s https://api-naki.yourdomain.com/api/manifest
```

## 3) Frontend on GitHub Pages

Use docs/index.html as static frontend.

1. Push repo to GitHub.
2. Open Settings > Pages.
3. Source: Deploy from branch.
4. Branch: main, folder: /docs.

Your frontend URL will be:

```text
https://<username>.github.io/<repo-name>/
```

## 4) Final endpoint for Monitor

Use this endpoint directly from Server Monitor:

```text
GET https://api-naki.yourdomain.com/api/v1/aoi?format=markas&limit=500
```

If token enabled, add header:

```text
Authorization: Bearer <STATION_API_TOKEN>
```

## 5) Optional push mode (backend pushes to monitor)

Set these in deploy/station.env:

```bash
MARKAS_WEBHOOK_URL=https://server-monitor.example.com/api/v1/monitor/coords
MARKAS_WEBHOOK_TOKEN=replace-with-monitor-token
MARKAS_WEBHOOK_INTERVAL=10
MARKAS_WEBHOOK_TIMEOUT=5
MARKAS_WEBHOOK_LIMIT=500
```

Check push status:

```bash
curl -s -H "Authorization: Bearer replace-with-strong-token" \
  https://api-naki.yourdomain.com/api/v1/webhook/status
```
