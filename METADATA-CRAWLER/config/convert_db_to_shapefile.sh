echo "Converting $2 (layer $3) to shapefile $1 ..."
ogr2ogr "$1" "$2" $3
echo "Done."
