#!/bin/bash

# Specify the folder path
folder_path="D:/UIMScanAutomation/uime4-rtc-development"

# Specify the file name
file_name="component.xml"

# Find all paths of the specified file recursively
find "$folder_path" -type f -name "$file_name" > output.txt

# Replace "component.xml" with a blank string in each line
sed -i 's/\/'"$file_name"'$//' output.txt

# Replace all forward slashes with backward slashes
sed -i 's/\//\\/g' output.txt

# Convert the newline-separated paths to a CSV file with a header
awk -v RS="" -v ORS="\n" 'BEGIN{print "folderPath"} {print $0}' output.txt > output.csv

echo "Paths of $file_name under $folder_path have been saved to output.csv"

