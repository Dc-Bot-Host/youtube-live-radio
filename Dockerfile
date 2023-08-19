FROM alpine:3

# Update and install Python, required packages, Bash, and FFmpeg
RUN apk update && \
    apk add --no-cache python3 && \
    pip3 install --upgrade pip && \
    apk add --no-cache bash ffmpeg

# Set the working directory inside the container
WORKDIR /usr/src/app/

# Copy all files and folders from your current directory into the container
COPY . /usr/src/app/

# Install Flask
RUN pip3 install Flask

# Expose the port that Flask will run on
EXPOSE 8080

# Run the Flask application
CMD ["python3", "main.py"]
