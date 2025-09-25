# FROM python:3.10-slim

# # Install prerequisites including netcat
# RUN apt-get update && \
#     apt-get install -y fortune-mod cowsay netcat-openbsd && \
#     rm -rf /var/lib/apt/lists/*

# # Set up the PATH to include cowsay
# ENV PATH="/usr/games:${PATH}"

# # Create app directory
# WORKDIR /app

# # Copy the wisecow script from the nested directory
# COPY wisecow/wisecow.sh .

# # Fix line endings and make executable
# RUN sed -i 's/\r$//' wisecow.sh && \
#     chmod +x wisecow.sh

# # Copy Flask wrapper
# COPY app.py .

# # Install Flask
# RUN pip install flask

# # Expose Flask port
# EXPOSE 3000

# # Run Flask app
# CMD ["python", "app.py"]

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
