# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg

# Set working directory
WORKDIR /app

# Copy all files and folders into the container
COPY . .

# Install Flask and other dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port 8080
EXPOSE 8080

# Set the command to run the Flask app
CMD ["python3", "main.py"]
