# Image Compression Script

This bash script recursively compresses all `.JPG`, `.JPEG`, and `.PNG` images in a directory (and its subdirectories) to 80% quality using `ffmpeg`. The compressed images are saved in a specified output directory while preserving the original directory structure.

## Prerequisites

Make sure `ffmpeg` is installed on your system. If not, you can install it using the following command:

### On Ubuntu/Debian:

```bash
sudo apt-get install ffmpeg
```

### On macOS (using Homebrew):

```bash
brew install ffmpeg
```

## Usage

1. Save the script to a file, for example, `compress_images_80.sh`.
2. Make the script executable:

```bash
chmod +x compress_images_80.sh
```

3. Run the script:

```bash
./compress_images_80.sh
```

## Script Details

- The script compresses all `.JPG`, `.JPEG`, and `.PNG` files in the current directory and its subdirectories to 80% quality.
- This updated script will create a folder named "output" in the parent directory of where the script is executed, and it will save the output files there.
- The original directory structure is preserved in the output directory.

## Script

```bash
#!/bin/bash

# Root directory and output directory
root_dir="."

# Define root directory and output directory
root_dir="."
output_dir="$(dirname "$(pwd)")/compressed_output"

# If the output directory does not exist, create it
mkdir -p "$output_dir"

# Find and process all JPG, JPEG and PNG files
find "$root_dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | while read -r img; do
    # Create the path to the output file, preserving the directory structure of the original file
    output_img="$output_dir/${img#$root_dir/}"
    output_img="${output_img%.*}.jpg"
    
    # Create the output directory (including subdirectories)
    mkdir -p "$(dirname "$output_img")"
    
    # compress with ffmpeg at 80% quality and save to output directory
    ffmpeg -i "$img" -q:v 20 "$output_img"
done


# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Find and process all JPG, JPEG, and PNG files
find "$root_dir" -type f \( -iname '*.JPG' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.JPEG' -o -iname '*.png' -o -iname '*.PNG' \) | while read -r img; do
    # Create output file path preserving directory structure
    output_img="$output_dir/${img#$root_dir/}"
    output_img="${output_img%.*}.JPG"
    
    # Create output directory if it doesn't exist (including subdirectories)
    mkdir -p "$(dirname "$output_img")"
    
    # Compress image to 80% quality and save to output directory
    ffmpeg -i "$img" -q:v 20 "$output_img"
done
```

## Notes

- Ensure you have write permissions for the output directory.
- The `-q:v 20` option in `ffmpeg` approximates 80% quality. Adjust as needed.
- This script does not overwrite the original files. The compressed files are saved in the specified output directory.

## License

There is no licensing. It is for utility purposes.
