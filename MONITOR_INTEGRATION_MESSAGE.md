# Monitor Integration Message Template

## Chat Version (Short)

Halo tim Server Monitor,

kami kirim integrasi endpoint final untuk data titik koordinat SSID hasil scan:

- Endpoint: `POST /api/v1/monitor/coords`
- Content-Type: `application/json`
- Auth (opsional): `Authorization: Bearer <token>`

Payload yang dikirim berisi titik koordinat untuk kebutuhan map:

```json
{
  "schema_version": "markas.coords.v1",
  "generated_at": "2026-07-01T00:00:00Z",
  "source_system": "NAKI_PRIMA",
  "points": [
    {
      "ssid": "NamaSSID",
      "latitude": -6.219589,
      "longitude": 106.940264
    }
  ]
}
```

Field wajib untuk pemetaan:
- `points[].latitude`
- `points[].longitude`

Field opsional:
- `points[].ssid`

---

## Email Version (Formal)

Subject: Final API Endpoint for SSID Coordinate Integration to Server Monitor

Hello Server Monitor Team,

Please use the following final endpoint for receiving scanned SSID coordinates from NAKI_PRIMA:

- Method: `POST`
- Path: `/api/v1/monitor/coords`
- Headers:
  - `Content-Type: application/json`
  - `Authorization: Bearer <token>` (optional, if enabled)

Request payload example:

```json
{
  "schema_version": "markas.coords.v1",
  "generated_at": "2026-07-01T00:00:00Z",
  "source_system": "NAKI_PRIMA",
  "points": [
    {
      "ssid": "NamaSSID",
      "latitude": -6.219589,
      "longitude": 106.940264
    }
  ]
}
```

Minimum required fields for map rendering:
- `points[].latitude`
- `points[].longitude`

Optional field for marker labeling:
- `points[].ssid`

Suggested success response:

```json
{
  "status": "success",
  "message": "coordinates received",
  "count": 1
}
```

Suggested error response:

```json
{
  "status": "error",
  "message": "invalid payload"
}
```

Regards,
NAKI_PRIMA Integration Team

---

## Quick Copy (One-line Brief)

Use `POST /api/v1/monitor/coords` and accept payload `markas.coords.v1` containing `points[].latitude` and `points[].longitude` (with optional `points[].ssid`) for map plotting.

---

## Related Files

- `docs/index.html` (GitHub Pages frontend)
- `docs/ONLINE_FASTTRACK.md` (fastest deployment sequence)
