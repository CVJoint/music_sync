# Unzip Files
  # Define the location of your zipped files and the unzip directory. This will
  # create a folder using the name of the zip file and unzip everything.

ZIPPED_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library [zipped]"
UNZIP_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library"
# NEWFILE is meant to record the new files/folders that are added. Commented out for first run
#NEWFILE="$UNZIP_DIR"/"$(date +"%Y-%m-%d-%H%M")"_new.log
ERRORFILE="$UNZIP_DIR"/error.log

#touch "$NEWFILE"
touch "$ERRORFILE"

for zippedFile in "$ZIPPED_DIR"/*/*.zip
do
  #echo "zippedFile=$zippedFile"
  folderYear=$(basename "$(dirname "$zippedFile")")
  #echo "folderYear=$folderYear"
  folderName=$(basename "$zippedFile" .zip)
  #echo "folderName=$folderName"
  outputFolder="$UNZIP_DIR"/"$folderYear"/"$folderName"
  #echo "outputFolder=$outputFolder"
  #sleep 1
  if [ ! -d "$outputFolder" ]; then
  #  echo "folderName= $folderName" >> "$NEWFILE"
    7z x -o"$outputFolder" "$zippedFile" 2>>"$ERRORFILE" || error=true
    if [ "$error" = "true" ] ; then
      echo "error with--> $folderName" | tee --append "$ERRORFILE"
      error=false
    fi
  fi
done

