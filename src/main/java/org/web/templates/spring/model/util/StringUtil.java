package org.web.templates.spring.model.util;

public class StringUtil {
	public static boolean isEmpty(String str) {
		boolean ret = true;
		if (str != null && str.length() > 0) {
			ret = false;
		}
		return ret;
	}

	public static boolean isNotEmpty(String str) {
		boolean ret = !isEmpty(str);
		return ret;
	}

	public static boolean isObjectEmpty(Object obj) {
		boolean ret = true;
		if (obj != null) {
			ret = false;
		}
		return ret;
	}

	public static boolean isObjectNotEmpty(Object obj) {
		boolean ret = !isObjectEmpty(obj);
		return ret;
	}

	public static boolean isNumeric(String str) {
		if (str == null)
			return false;
		try {
			Double.parseDouble(str);
		} catch (NumberFormatException nfe) {
			return false;
		}
		return true;
	}

	public static String cleanString(String str) {
		if (isNotEmpty(str)) {
			str = str.replace("\n", "").replace("\r", "");
		}
		return str;
	}

	public static String fixFilename(String name) {
		int ix = name.indexOf(" ");
		if (ix != -1 && name.toLowerCase().endsWith(".xml")) {
			int dot_ix = name.toLowerCase().lastIndexOf(".xml");
			return name.substring(0, ix) + name.substring(dot_ix);
		} else {
			return name;
		}
	}

	public static String trimString(String str) {
		String ret = "";
		if (isNotEmpty(str)) {
			ret = str.trim();
		}
		return ret;
	}

	public static boolean isEmptyOrZero(String str) {
		boolean ret = true;
		if (str != null && str.length() > 0) {
			ret = false;
		}
		return ret;
	}

	public static boolean isBrackets(String str) {
		boolean ret = false;
		if (str != null && str == "[]") {
			ret = true;
		}
		return ret;
	}

	public static String getUrl(boolean getFirst, String url1, String url2) {
		String url = url1;
		if (!getFirst) {
			url = url2;
		}
		return url;
	}

	public static String getEnabledUrl(String enabled, String url1, String url2) {
		String url = url1;
		if (isNotEmpty(enabled)) {
			if (enabled.equalsIgnoreCase("disabled") && isNotEmpty(url2)) {
				url = url2;
			}
		}
		return url;
	}

	public static String getEnabledSubMenu(String enabled) {
		String url = "enabled";
		if (isNotEmpty(enabled)) {
			if (enabled.equalsIgnoreCase("disabled")) {
				url = "disabled";
			}
		}
		return url;
	}
}
