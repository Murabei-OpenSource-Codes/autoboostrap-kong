# Check if kong have been bootstrapeted if not bootstrap it
echo "#######################"
echo "## Bootstraping Kong ##"
echo "#######################"
kong migrations bootstrap
kong migrations up
kong migrations finish
