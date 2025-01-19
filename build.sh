username=$(whoami)
compilerPath="/Users/$username/Developer/PlaydateSDK/bin/pdc"
sourcePath="./source"
outputPath="./builds/"
outputFile="$(basename "$(pwd)").pdx"

# Create "Builds" folder if it doesn't exist
if [ ! -d "$outputPath" ]; then
  mkdir "$outputPath"
fi

echo "Compiler path:  $compilerPath"
echo "Source path:    $sourcePath"
echo "Output path:    $outputPath"
echo ""

bash update-pdxinfo.sh

echo "Compile source..."
"$compilerPath" -k "$sourcePath" "$outputPath$outputFile"
