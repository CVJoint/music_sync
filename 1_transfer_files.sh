# Transfer Files
  # Use rclone to transfer from a remote shared folder ($FROM) to a local folder ($TO).

FROM="<remote>:<path/to/folder"
TO="/local/save/folder"

rclone sync "$FROM" "$TO" \
  --drive-shared-with-me \
  --progress \
  --verbose

exit

#  --transfers=3 \
#  --bwlimit=1M
