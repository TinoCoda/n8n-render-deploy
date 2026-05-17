# ---------- Stage 1: Build Python layer ----------
FROM debian:bookworm AS python-builder

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install only minimal Python libs for Code node
RUN pip3 install --break-system-packages beautifulsoup4 requests


# ---------- Stage 2: Final n8n image ----------
FROM n8nio/n8n:latest

# Switch to root to copy Python
USER root

# Copy Python binaries from builder
COPY --from=python-builder /usr/bin/python3 /usr/bin/python3
COPY --from=python-builder /usr/bin/pip3 /usr/bin/pip3
COPY --from=python-builder /usr/lib/python3 /usr/lib/python3
COPY --from=python-builder /usr/local/lib/python3.11 /usr/local/lib/python3.11

# Ensure n8n user owns everything
RUN chown -R node:node /usr/bin/python3 /usr/bin/pip3 /usr/lib/python3 /usr/local/lib/python3.11

# Switch back to n8n user
USER node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
