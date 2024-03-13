#!/bin/bash
# Script to list and potentially delete all ._ files from an external drive

# Flag to skip confirmation
SKIP_CONFIRM=false

# Process command-line arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -s|--skip)
      SKIP_CONFIRM=true
      shift # past argument
      ;;
    *)
      shift # past argument
      ;;
  esac
done

# Replace the following path with the path to your external drive
EXTERNAL_DRIVE_PATH="/Volumes/Extreme Pro"

# Safely handle file names that contain newlines or other types of white space.
OLD_IFS=$IFS
IFS=$'\n'

# Common find command for parallel execution
common_find_cmd="find {} \( -name '.Spotlight-V100' -or -name '.TemporaryItems' -or -name '.Trashes' \) -prune -o -name '._*' -type f"

# Check if parallel is installed
if command -v parallel &> /dev/null; then
    echo "parallel is installed, using parallel execution."
    files=$(find "$EXTERNAL_DRIVE_PATH" -type d 2>/dev/null | parallel -j8 "$common_find_cmd -print 2>/dev/null")
else
    echo "parallel is not installed, using single-threaded execution."
    files=$(find "$EXTERNAL_DRIVE_PATH" \( -name '.Spotlight-V100' -or -name '.TemporaryItems' -or -name '.Trashes' \) -prune -o -name '._*' -type f -print 2>/dev/null)
fi

# Print found files
echo "Found the following ._ files:"
echo "$files"

# Restore IFS
IFS=$OLD_IFS

# Check if the user wants to proceed or if the skip flag is set
if $SKIP_CONFIRM; then
  confirm="y"
else
  read -p "Do you want to delete these files? [y/N]: " confirm
fi

if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
  # Delete the files
  if command -v parallel &> /dev/null; then
      find "$EXTERNAL_DRIVE_PATH" -type d 2>/dev/null | parallel -j8 "$common_find_cmd -exec rm -f {} + 2>/dev/null"
  else
      find "$EXTERNAL_DRIVE_PATH" \( -name '.Spotlight-V100' -or -name '.TemporaryItems' -or -name '.Trashes' \) -prune -o -name '._*' -type f -exec rm -f {} + 2>/dev/null
  fi
  
  echo "Deleted all ._ files from $EXTERNAL_DRIVE_PATH"
else
  echo "No files were deleted."
fi
