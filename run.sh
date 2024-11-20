simulatorPath='/Users/johannes.eldering/Developer/PlaydateSDK/bin/Playdate Simulator.app/Contents/MacOS/Playdate Simulator'
outputPath="./builds/"
outputFile="$(basename "$(pwd)").pdx"

echo "Simulator path: $simulatorPath"
echo "Output path:    $outputPath$outputFile"
echo ""

echo "Opening simulator..."
"$simulatorPath" "$outputPath$outputFile"
