outputPath="./builds/"
outputFile="$(basename "$(pwd)").pdx"

echo "Output path: $outputPath$outputFile"
echo ""

echo "Opening simulator..."
open "$outputPath$outputFile"
