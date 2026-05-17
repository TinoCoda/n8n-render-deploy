FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

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

# (Optional but useful) Install common Python libs for your workflows
RUN pip3 install --no-cache-dir \
    beautifulsoup4 \
    requests

# Switch back to n8n user
USER node
# Default command (keep n8n as entrypoint )
CMD ["n8n"]