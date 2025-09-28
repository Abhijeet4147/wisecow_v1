
# FROM python:3.10-slim

# # Install dependencies
# RUN apt-get update && \
#     apt-get install -y fortune-mod cowsay && \
#     rm -rf /var/lib/apt/lists/*

# # Ensure PATH includes /usr/games (fortune + cowsay live here)
# ENV PATH="/usr/games:${PATH}"

# # Copy Flask app
# WORKDIR /app
# COPY app.py .

# # Install Flask
# RUN pip install flask

# EXPOSE 3000
# CMD ["python", "app.py"]
FROM python:3.10-slim

# Install dependencies (fortune + cowsay)
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    rm -rf /var/lib/apt/lists/*

# Ensure PATH includes /usr/games (where fortune + cowsay are installed)
ENV PATH="/usr/games:${PATH}"

# Set working directory
WORKDIR /app

# Copy files
COPY wisecow/wisecow.sh ./wisecow.sh
COPY app.py .

# Fix line endings (for Windows -> Linux) and make executable
RUN sed -i 's/\r$//' wisecow.sh && chmod +x wisecow.sh

# Install Flask
RUN pip install flask

# Expose Flask port
EXPOSE 3000

# Run Flask app
CMD ["python", "app.py"]
