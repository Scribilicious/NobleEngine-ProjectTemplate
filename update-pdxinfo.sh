#!/bin/bash

# Define the path to your pdxinfo file
pdxinfo_file="source/pdxinfo"

# Check if the file exists
if [[ ! -f "$pdxinfo_file" ]]; then
    echo "File not found: $pdxinfo_file"
    exit 1
fi

# Read the current build number
current_build_number=$(grep '^buildNumber=' "$pdxinfo_file" | cut -d'=' -f2)

# Check if we successfully retrieved the build number
if [[ -z "$current_build_number" ]]; then
    echo "Could not find buildNumber in $pdxinfo_file"
    exit 1
fi

# Increment the build number
new_build_number=$((current_build_number + 1))

# Update the pdxinfo file with the new build number
# Use a temporary file to avoid issues with in-place editing
temp_file=$(mktemp)

# Replace the buildNumber line in the temporary file
while IFS= read -r line; do
    if [[ $line == buildNumber=* ]]; then
        echo "buildNumber=$new_build_number" >> "$temp_file"
    else
        echo "$line" >> "$temp_file"
    fi
done < "$pdxinfo_file"

# Move the temporary file back to the original file
mv "$temp_file" "$pdxinfo_file"

echo "Updated buildNumber from $current_build_number to $new_build_number"