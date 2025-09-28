
FROM python:3.10-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    rm -rf /var/lib/apt/lists/*

# Ensure PATH includes /usr/games (fortune + cowsay live here)
ENV PATH="/usr/games:${PATH}"

# Copy Flask app
WORKDIR /app
COPY app.py .

# Install Flask
RUN pip install flask

EXPOSE 3000
CMD ["python", "app.py"]
