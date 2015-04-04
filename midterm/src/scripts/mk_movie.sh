#!/bin/bash

SRC=$1
FFMPEG=/usr/local/bin/ffmpeg
BIN=${SRC}

mkdir -p ${BIN}
${FFMPEG} -framerate 30  -i ${SRC}/image_%04d.png -c:v libx264 -pix_fmt yuv420p ${BIN}/movie_30FPS.mp4
${FFMPEG} -framerate 60  -i ${SRC}/image_%04d.png -c:v libx264 -pix_fmt yuv420p ${BIN}/movie_60FPS.mp4
${FFMPEG} -framerate 120 -i ${SRC}/image_%04d.png -c:v libx264 -pix_fmt yuv420p ${BIN}/movie_120FPS.mp4

         
