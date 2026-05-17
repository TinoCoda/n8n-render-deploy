# ---------- Stage 1: Build Python layer ----------
FROM debian:bookworm AS python-builder

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages beautifulsoup4 requests

# ---------- Stage 2: Final n8n image ----------
FROM n8nio/n8n:latest

USER root

COPY --from=python-builder /usr/bin/python3 /usr/bin/python3
COPY --from=python-builder /usr/bin/pip3    /usr/bin/pip3
COPY --from=python-builder /usr/lib/python3 /usr/lib/python3
COPY --from=python-builder /usr/local/lib/python3.11 /usr/local/lib/python3.11

RUN chown -R node:node \
    /usr/bin/python3 \
    /usr/bin/pip3 \
    /usr/lib/python3 \
    /usr/local/lib/python3.11

USER node

EXPOSE 5678

# Use absolute path — avoids PATH resolution issues on Render
CMD ["/usr/local/bin/n8n"]