### DuckDNS

Run the DuckDNS updater for dynamic DNS in a container on Raspberry Pi

#### Setup

1) Copy `.env.template` to `.env`.

2) Update `TOKEN` and `SUMBDOMAINS` variables within `.env` and save.

3) Build and launch container:
```
docker-compose build
docker-compose up
```
4) Configure crontab to run container twice and hour:
```
5,35 * * * * docker-compose -f /home/pirate/docker-duckdns/docker-compose.yml up -d
```
