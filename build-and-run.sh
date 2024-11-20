username=$(whoami)
compilerPath="/Users/$username/Developer/PlaydateSDK/bin/pdc"
simulatorPath="/Users/$username/Developer/PlaydateSDK/bin/Playdate Simulator.app/Contents/MacOS/Playdate Simulator"
sourcePath="./source"
outputPath="./builds/"
outputFile="$(basename "$(pwd)").pdx"

# Create "Builds" folder if it doesn't exist
if [ ! -d "$outputPath" ]; then
  mkdir "$outputPath"
fi

echo "Compiler path:  $compilerPath"
echo "Simulator path: $simulatorPath"
echo "Source path:    $sourcePath"
echo "Output path:    $outputPath$outputFile"
echo ""

echo "Compile source..."
"$compilerPath" -k "$sourcePath" "$outputPath$outputFile"

echo "Opening simulator..."
"$simulatorPath" "$outputPath$outputFile"
