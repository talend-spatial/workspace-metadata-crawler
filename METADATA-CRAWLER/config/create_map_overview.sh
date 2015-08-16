echo "Creating map overview for $1 (overview is $2) ..."
qgis --nologo --noplugins --snapshot "$2" "$1"
echo "Done."
