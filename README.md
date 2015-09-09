Automatic geospatial data inventory with Talend Spatial
=======================================================

The data inventory is made by scanning folders, databases or webservices. 
For each geospatial resource (ie. file, tables, layers, maps) found, main properties 
(eg. bounding box, projection, file type) are computed and metadata records created. 
After creation of the metadata record, those are published into a CSW catalog.

For vector resources, 2 metadata records are created :
* one metadata for the dataset following ISO19139 standards
* one metadata for the feature catalog (ie. list of columns, datatype, …) following ISO19110 standards

For RASTER datasets, only the dataset metadata record is created.

For maps, one record is created for the map and one record for each datasources used in that map.

Datasets can be optionnaly bundled as a ZIP package which could is then registered in the metadata record and published in a webserver for download.

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
  * Interlis
  * WFS
 * RASTER
  * TIFF
  * ASC
  * GeoPDF
  * ECW
  * JPEG
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
  * list of columns and types


Documentation
-------------

* [In english](https://docs.google.com/document/d/1Z-lJDGMX1tO3377Ytgoos0nGxqqN2rF-GyqiOB4iAVY/edit?usp=sharing)
* [In french](https://docs.google.com/document/d/10GyQLL9XORawurILl6AUCpP7PDfcQ3D3nkBO1Le3UI8/edit) pour réaliser un inventaire automatique du patrimoine d'information géographique avec Talend Spatial
* https://github.com/talend-spatial/talend-spatial/wiki/Data-inventory
