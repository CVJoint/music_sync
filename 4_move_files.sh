# Move Files
  # Move files from the single sub-folder into the correctly named parent folder
  # and delete the sub-folder.

#FOLDERS=$1
ZIPPED_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library [zipped]"
UNZIP_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library"
ERRORFILE="$UNZIP_DIR"/error.log

touch "$ERRORFILE"

for zippedFile in "$UNZIP_DIR"/*/*
do
  #echo "zippedFile=$zippedFile"
  folderYear=$(basename "$(dirname "$zippedFile")")
  #echo "folderYear=$folderYear"
  folderName=$(basename "$zippedFile")
  #echo "folderName=$folderName"
  outputFolder="$UNZIP_DIR"/"$folderYear"/"$folderName"
  #echo "outputFolder=$outputFolder"
  #sleep 1
  for old_dir in "$outputFolder"/*
  do
    #echo "old_dir=$old_dir"
    mv "$old_dir"/* "$outputFolder"/
    rm -r "$old_dir"
  done
done

