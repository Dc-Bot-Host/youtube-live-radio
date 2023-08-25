#!/bin/bash

set -e

while true
do
  ffmpeg -loglevel info -y -re \
    -f image2 -loop 1 -i bg.png \
    -f concat -safe 0 -i <((for f in ./mp3/*.mp3; do path="$PWD/$f"; echo "file ${path@Q}"; done) | shuf) \
    -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
    -framerate 25 -video_size 1280x720 -vf "format=yuv420p" -g 50 -shortest -strict experimental \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv rtmp://broadcast.api.video/s/cb08eb88-ba24-4d7e-8b8b-a1cc84b89e2e
done
