Automatic geospatial data inventory with Talend Spatial
=======================================================

The data inventory is made by scanning folders, databases or webservices. 
For each geospatial resource (ie. file, table, layers) found, main properties 
(eg. bounding box, projection) are computed and metadata records created. 
After metadata generated, they could be published into a catalog.

For vector resources, 2 metadata records are created :
* one metadata for the dataset following ISO19139 standards
* one metadata for the feature catalog (ie. list of columns, datatype, …) following ISO19110 standards

For RASTER dataset, only the dataset metadata record is created.

For maps, one record is created for the map and one record for each datasources.

Data formats
------------


All GDAL/OGR formats should be supported (cf. http://www.gdal.org/ogr/ogr_formats.html).

The following have been tested:
 * Vector
  * ESRI Shapefile
  * Mapinfo Tab
  * Table PostGIS
  * GPX
  * KML
  * DXF
  * WFS
 * RASTER
  * TIFF
  * ASC
  * GeoPDF
  * ECW
 * Map
  * QGIS map

GIS file extracted properties
-----------------------------

From the analyzed file, the following properties are extracted :
 * file format,
 * bounding box,
 * projection,
 * data type (eg. point, line, polygon),
 * link to the file or table (ie. link on the network or URL of the database),
 * number of features,
 * and for vector file 
  * list of columns and type


Documentation
-------------

https://github.com/talend-spatial/talend-spatial/wiki/Data-inventory
