FROM jrottenberg/ffmpeg:4.4-alpine

ENTRYPOINT []

# Copy the script in
COPY optimize.sh /opt/optimize.sh

# Convert CRLF to LF and make it executable
RUN sed -i 's/\r$//' /opt/optimize.sh \
 && chmod +x /opt/optimize.sh

CMD ["sh", "-c", "while true; do /opt/optimize.sh; sleep 300; done"]
