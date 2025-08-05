# Use the Python 3.12 slim image
FROM python:3.12-slim

LABEL org.opencontainers.image.source=https://github.com/protectai/llm-guard
LABEL org.opencontainers.image.description="LLM Guard API"
LABEL org.opencontainers.image.licenses=MIT

# Install system packages needed for building
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy all necessary files into the image
COPY pyproject.toml ./
COPY README.md ./          # Make sure this file exists!
COPY app ./app

# Install Python dependencies as root to avoid permission issues
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -e ".[cpu]"

# Download the spaCy model
RUN python -m spacy download en_core_web_sm

# Create non-root user
RUN useradd -m -u 1000 user

# Set proper ownership for runtime files
COPY --chown=user:user ./config/scanners.yml ./config/scanners.yml
COPY --chown=user:user entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# Switch to non-root user for running the app
USER user

# Set environment variables
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
