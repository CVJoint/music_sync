# Check Extra Files
  # This script will check the $outputFolder to see if there is more than the
  # "1" directory that was  created using unzip_files.sh.
  # After running this file, check the $EXTRASFILE to see which folders need to
  # be cleaned up.
  # Delete extra files/folders or move extracted contents into a single
  # sub-folder.

ZIPPED_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library [zipped]"
UNZIP_DIR="/mnt/storage/music/music/Grateful Dead/Chronological library"
EXTRASFILE="$UNZIP_DIR"/"$(date +"%Y-%m-%d-%H%M")"_extras.log

touch "$EXTRASFILE"

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
  # Count number of files/folders in $outputFolder and if more than 1 print name
  # to $EXTRASFILE
  if [ `ls -1A "$outputFolder" | wc -l` -gt "1" ]; then
    echo "folderName= $folderName" >> "$EXTRASFILE"
  fi
done

