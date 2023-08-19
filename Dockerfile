FROM alpine:3

# Update and install Python and required packages
RUN apk update && \
    apk add --no-cache python3 && \
    pip3 install --upgrade pip && \
    apk add --no-cache bash ffmpeg

# Set the working directory inside the container
WORKDIR /usr/src/app/

# Copy all files and folders from your current directory into the container
COPY . /usr/src/app/

RUN pip3 install Flask

# Run the Python file (replace with your actual command)
CMD ["python3", "main.py"]
