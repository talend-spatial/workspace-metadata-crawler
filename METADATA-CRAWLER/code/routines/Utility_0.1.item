package routines;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import org.talend.sdi.geometry.Geometry;

/*
 * user specification: the function's comment should contain keys as follows: 1. write about the function's comment.but
 * it must be before the "{talendTypes}" key.
 * 
 * 2. {talendTypes} 's value must be talend Type, it is required . its value should be one of: String, char | Character,
 * long | Long, int | Integer, boolean | Boolean, byte | Byte, Date, double | Double, float | Float, Object, short |
 * Short
 * 
 * 3. {Category} define a category for the Function. it is required. its value is user-defined .
 * 
 * 4. {param} 's format is: {param} <type>[(<default value or closed list values>)] <name>[ : <comment>]
 * 
 * <type> 's value should be one of: string, int, list, double, object, boolean, long, char, date. <name>'s value is the
 * Function's parameter name. the {param} is optional. so if you the Function without the parameters. the {param} don't
 * added. you can have many parameters for the Function.
 * 
 * 5. {example} gives a example for the Function. it is optional.
 */
public class Utility {

	/**
	 * sha256Digest: Hash String via SHA-256
	 * 
	 * 
	 * {talendTypes} String
	 * 
	 * {Category} User Defined
	 * 
	 * {param} string("text") input: The string need to be hashed.
	 * 
	 * {example} sha256Digest("world")
	 */
	public static String sha256Digest(String text) {
		java.security.MessageDigest md;
		byte[] digest = null;

		try {
			md = java.security.MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes("UTF-8"));
			digest = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (digest != null) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < digest.length; ++i) {
				String hex = Integer.toHexString(digest[i]);
				if (hex.length() == 1) {
					sb.append(0);
					sb.append(hex.charAt(hex.length() - 1));
				} else {
					sb.append(hex.substring(hex.length() - 2));
				}
			}
			return sb.toString();
		} else {
			return "";
		}
	}
	

	/**
	 * <datasource>dbname='talend' host=localhost port=5432 user='www-data' password='www-data' 
	 * sslmode=disable key='tid' srid=0 type=POLYGON table="public"."country" (the_geom) sql=</datasource>
	 * <PG:dbname=talend host=localhost port=5432 user=www-data password=www-data>
	 * @param qgisDbConnection
	 * @return
	 */
	public static java.util.Map<String, String> parseQGSDbConnection(String qgisDbConnection) {
		java.util.Map<String, String> dbConnectionParameter = new java.util.HashMap<String, String>();
		java.util.List<String> arrayOfParameters = java.util.Arrays.asList(qgisDbConnection.split(" "));
		if (arrayOfParameters.size() > 0) {
			for (String param : arrayOfParameters) {
				String[] token = param.split("=");
				if (token.length == 2) {
					String value = token[1].replace("'", "").replace("\"", "");
					dbConnectionParameter.put(
							token[0], 
							value);
					if (token[0].equals("table")) {
						if (value.contains(".")) {
							String[] tableToken = value.split("\\.");
							if (tableToken.length == 2) {
								dbConnectionParameter.put("tableSchema", tableToken[0]);
								dbConnectionParameter.put("tableName", tableToken[1]);									
							}
						} else {
							dbConnectionParameter.put("tableSchema", "public");
							dbConnectionParameter.put("tableName", value);									
						}
					}
				} else {
					// TODO: eg. (the_geom)
				}
			}
		}
		return dbConnectionParameter;
	}

    public static Geometry PROJ(Geometry geom, String fromEPSG, String toEPSG, boolean lenient) {

        org.opengis.referencing.crs.CoordinateReferenceSystem sourceCRS = null;
        org.opengis.referencing.crs.CoordinateReferenceSystem targetCRS = null;
        org.opengis.referencing.operation.MathTransform transform = null;
        try {
            sourceCRS = org.geotools.referencing.CRS.decode(fromEPSG, false);
            targetCRS = org.geotools.referencing.CRS.decode(toEPSG, false);
            transform = org.geotools.referencing.CRS.findMathTransform(
                    sourceCRS, targetCRS, false);
            org.talend.sdi.geometry.Geometry geomProj = new org.talend.sdi.geometry.Geometry(
                    org.geotools.geometry.jts.JTS.transform(
                            geom._getInternalGeometry(), transform));

            geomProj.setCRS(targetCRS);
            return geomProj;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return null;
        }
    }
	/**
	 * convertAccentsToRegularLetters: Convert accents to regular letters
	 * 
	 * 
	 * {talendTypes} String
	 * 
	 * {Category} User Defined
	 * 
	 * {param} string("text") input: The string need to be converted.
	 * 
	 * {example} convertAccentsToRegularLetters("âéèï")
	 */
	public static String convertAccentsToRegularLetters(String text) {
		return java.text.Normalizer
	        .normalize(text, java.text.Normalizer.Form.NFD)
	        .replaceAll("[^\\p{ASCII}]", "");
	}
	

	/**
	 * returnFirstNotNullOrBlank: return the first argument not null or blank.
	 * If no arguments match these conditions, return empty string.
	 * 
	 * {talendTypes} String
	 * 
	 * {Category} User Defined
	 * 
	 * {param} string("one") input: The list of string need to be checked
	 * 
	 * {example} returnFirstNotNullOrBlank(null, "  ", "one", null) # "one"
	 */
	public static String returnFirstNotNullOrBlank(String... stringToCheck) {
		for (String s : stringToCheck) {
			if (s != null && !s.trim().equals("null") && !s.trim().equals("")) {
				return s;
			}
		}
		return "";
	}

	/**
	 * isWindows: return true if operating system is Windows.
	 * 
	 * {talendTypes} boolean
	 * 
	 * {Category} User Defined
	 * 
	 * {example} isWindows()
	 */
	public static boolean isWindows() {
		return System.getProperty("os.name").startsWith("Windows");
	}
	
	/**
	 * base64encode: return the string base64 encoded
	 * 
	 * {talendTypes} boolean
	 * 
	 * {Category} User Defined
	 * 
	 * {example} base64encode("admin:admin")
	 */
	public static String base64encode(String stringToEncode) {
		byte[] encodedBytes = com.sun.jersey.core.util.Base64.encode(stringToEncode.getBytes());

		return new String(encodedBytes);
	}
	
	
}
