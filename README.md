**How to setup:
(All setup is written in powershell as you have much better alternatives than this on native linux)**
1. Build the initial image at the directory containing optimize.sh and Dockerfile with: docker build -t fireshare-optimizer:latest .
2. Deploy using docker compose: docker compose -f optimizer.yml up -d

This was built for [Fireshare](https://github.com/ShaneIsrael/fireshare) streaming playback but it will work for any other playback over the internet services that you are hosting

Future improvements:
1. Design a Python watch script to avoid having to index through the entire folder every few minutes (can get really bad as the directory grows in size) This also removes the needs for markers for each video which can grow exponentially also crowding container logs.
