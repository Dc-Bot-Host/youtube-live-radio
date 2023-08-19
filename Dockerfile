#FROM alpine:3

# Update and install Python, required packages, Bash, and FFmpeg
#RUN apk update && \
    apk add --no-cache python3 && \
    pip3 install --upgrade pip && \
    apk add --no-cache bash ffmpeg

# Set the working directory inside the container
#WORKDIR /usr/src/app/

# Copy all files and folders from your current directory into the container
#COPY . /usr/src/app/

# Install Flask
#RUN pip3 install Flask

# Expose the port that Flask will run on
#EXPOSE 8080

# Run the Flask application
#CMD ["python3", "main.py"]

# Use the official Python base image
FROM python:3.9

# Create and set the working directory inside the container
WORKDIR /app

# Copy all files from the local directory into the container
COPY . /app/

# Install required packages
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    pip install -r requirements.txt

# Make shell scripts executable
RUN chmod +x alive.sh yt.sh run.sh

# Expose port 8080
EXPOSE 8080

# Run the Python script when the container starts
CMD ["python", "main.py"]
