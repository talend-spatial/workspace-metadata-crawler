echo "Creating overview for %1 (layer %2) ..."
gdal_rasterize -ts %5 %6 -ot Byte -burn 111 %2 "%1" "%3"
gdal_translate -a_nodata 0 -of PNG -outsize %5 %6 -b 1 "%3" "%4"
echo "Done."
