#!/bin/sh

VIDEO_DIR="/videos/uploads"

echo "[*] Scanning $VIDEO_DIR for unoptimized .mp4 files..."

for f in "$VIDEO_DIR"/*.mp4; do
  [ -e "$f" ] || continue

  MARKER="$f.optimized"

  if [ -f "$MARKER" ]; then
    echo "[-] Already optimized: $f"
    continue
  fi

  TMP_FILE="${f%.*}_temp.mp4"

  echo "[>] Optimizing $f ..."
  ffmpeg -y -i "$f" -vf scale=-2:1080 -c:v libx264 -crf 23 -preset fast -c:a aac -b:a 128k -movflags +faststart "$TMP_FILE"

  if [ -f "$TMP_FILE" ]; then
    mv "$TMP_FILE" "$f"
    touch "$MARKER"
    echo "[+] Replaced original and marked as optimized: $f"
  else
    echo "[!] Optimization failed: $f"
  fi
done
