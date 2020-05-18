package kr.co.coduck.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat normalDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String dateToString(Date date) {
		if(date == null) {
			return null;
		}
		return normalDateFormat.format(date);
	}
	
}
