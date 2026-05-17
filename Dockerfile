# Use Debian so apt-get works
FROM debian:bookworm

# Install Node.js 18, Python, and build tools
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g n8n \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python libs you need (Debian Bookworm requires this flag)
RUN pip3 install --break-system-packages beautifulsoup4 requests

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
