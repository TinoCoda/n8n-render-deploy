FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Install Python 3 and pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

# (Optional but useful) Install common Python libs for your workflows
RUN pip3 install --no-cache-dir \
    beautifulsoup4 \
    requests

# Switch back to n8n user
USER node
# Default command (keep n8n as entrypoint )
CMD ["n8n"]