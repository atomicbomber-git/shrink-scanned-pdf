#!/bin/bash

complete_filename=$1
base_filename=$(basename "$complete_filename")
temp_dir="temp"

# Check if mogrify exists
if [ ! command -v "mogrify" &> /dev/null ]; then
    printf "This script requires the mogrify command to exist."
    exit 1
fi

# Print info about the original file
du -sh "$complete_filename"

# Remove temp dir if it exists
rm -rf "$temp_dir"

# Create a temporary directory to store half-converted data
mkdir "$temp_dir"

# Convert each page to individual JPEG files
pdftocairo "$complete_filename" -jpeg "$temp_dir/"

# Compress each JPEG file
mogrify -compress JPEG -quality 20 "$temp_dir/*"

# Convert each JPEG file to PDF
mogrify -format pdf "$temp_dir/*"

# Merge individual PDF files into one PDF file
output_filename="compressed_$base_filename"
pdfunite "$temp_dir"/*.pdf "$output_filename"

# Remove temporary directory
rm -rf "$temp_dir"

echo "Output file is $output_filename"

# Print info about the output file
du -sh "$output_filename"
