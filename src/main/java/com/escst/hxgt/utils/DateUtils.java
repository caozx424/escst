package com.escst.hxgt.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 日期工具类
 * 
 * @author Administrator
 * 
 */
public class DateUtils {
	public static final String TO_YEAR = "yyyy";
	public static final String TO_MONTH = "yyyy-MM";
	public static final String TO_DATE = "yyyy-MM-dd";
	public static final String TO_MINUTE = "yyyy-MM-dd HH:mm";
	public static final String TO_SECOND = "yyyy-MM-dd HH:mm:ss";
	public static final String TO_MILLISECOND = "yyyy-MM-dd HH:mm:ss SSSS";
	public static final String TO_MONTH_N = "yyyyMM";
	public static final String TO_DATE_N = "yyyyMMdd";
	public static final String TO_MINUTE_N = "yyyyMMddHHmm";
	public static final String TO_SECOND_N = "yyyyMMddHHmmss";
	public static final String TO_MILLISECOND_N = "yyyyMMddHHmmssSSSS";
	
	public static final String TO_MONTH_CHINA = "yyyy年MM月";

	public static final String DATA_SEPARATE = " TO ";
	private static Logger logger = LoggerFactory.getLogger("DateUtils");
	
	public static void main(String[] args) {
		Date date = DateUtils.addMinute(new Date(), 30);
		System.out.println(date);
	}
	
	/**
	 * 
	 * @Title: getCurrentDate
	 * @Description: 获取当前时间
	 * @return String 返回日期时间  
	 * @throws
	 */
	public static String getCurrentDate(){
		SimpleDateFormat formater = new SimpleDateFormat(TO_SECOND);
		return formater.format(new Date());
	}

	/**
	 * 获取当前年
	 * @return
	 */
	public static String getCurrentYear(){
		SimpleDateFormat formater = new SimpleDateFormat(TO_YEAR);
		return formater.format(new Date());
	}
	/**
	 * 
	 * @Title: getCurrentMonth
	 * @Description: 获取当前月
	 * @param @return    
	 * @return String   
	 * @throws
	 * @author LUOFUJIA
	 * @date 2015年4月8日 下午2:51:50
	 */
	public static String getCurrentMonth(){
		SimpleDateFormat formater = new SimpleDateFormat(TO_MONTH_CHINA);
		return formater.format(new Date());
	}
	
	/**
	 * 将Date对象解析成指定格式的字符串。
	 * 
	 * @param date
	 *            Date对象
	 * @param pattern
	 *            格式
	 * @return 返回指定格式的字符串。
	 */
	public static String format(Date date, String pattern) {
		SimpleDateFormat formater = new SimpleDateFormat(pattern);
		return formater.format(date);
	}

	/**
	 * 将指定格式的字符串解析成Date对象。
	 * 
	 * @param str
	 *            字符串
	 * @param format
	 *            格式
	 * @return 返回对应的Date对象。
	 */
	public static Date parse(String str, String format) {
		SimpleDateFormat parser = new SimpleDateFormat(format);
		try {
			return parser.parse(str);
		} catch (ParseException e) {
			logger.error("字符串转换为date类型出错", e);
		}
		return null;
	}

	/**
	 * 获取今天日期00:00:00开始。
	 * 
	 * @return 返回当前日期。
	 */
	public static Date getTodayStart() {
		Calendar cal = Calendar.getInstance();
		Date date = new Date();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获取今天日期23:59:59结束。
	 * 
	 * @return 返回当前日期。
	 */
	public static Date getTodayEnd() {
		Calendar cal = Calendar.getInstance();
		Date date = new Date();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.DATE, 1);
		return cal.getTime();
	}

	/**
	 * 获取日期00:00:00开始。
	 * 
	 * @param dateTime
	 *            时间字符串
	 * @return 返回当前日期。
	 */
	public static Date getDateStart(String dateTime) {
		Calendar cal = Calendar.getInstance();
		Date date = DateUtils.parse(dateTime, TO_DATE);
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获取今天日期23:59:59结束。
	 * 
	 * @param dateTime
	 *            时间字符串
	 * @return 返回当前日期。
	 */
	public static Date getDateEnd(String dateTime) {
		Calendar cal = Calendar.getInstance();
		Date date = DateUtils.parse(dateTime, TO_DATE);
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 59);
		// cal.add(Calendar.DATE, 1);
		return cal.getTime();
	}

	/**
	 * 获取7天日期开始00:00:00
	 * 
	 * @return 返回七天前日期
	 */
	public static Date getPreSevenday() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.DATE, -6);
		return cal.getTime();
	}

	/**
	 * 获取昨天日期00:00:00。
	 * 
	 * @return 返回昨天日期。
	 */
	public static Date getYesToday() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * 获取昨天日期00:00:00。
	 * 
	 * @return 返回昨天开始日期。
	 */
	public static Date getYesTodayEnd() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 时间计算
	 * 
	 * @param date
	 *            计算时间
	 * @param t
	 *            计算天数 正数为加 负数为减(单位：天)
	 * @return 时间
	 */
	public static Date addDate(Date date, int t) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, t);
		return cal.getTime();
	}

	/**
	 * 时间计算
	 * 
	 * @param date
	 *            计算时间
	 * @param t
	 *            计算天数 正数为加 负数为减(单位：小时)
	 * @return 时间
	 */
	public static Date addTime(Date date, int t) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, t);
		return cal.getTime();
	}
	
	public static Date addMinute(Date date,int minute){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, minute);
		return cal.getTime();
	}
	
	/**
	 * 获取今天开始的时间
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getTodayStartToString(String format) {
		return format(getTodayStart(), format);
	}

	/**
	 * 获取今天结束的时间
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getTodayEndToString(String format) {
		return format(getTodayEnd(), format);
	}

	/**
	 * 获取昨天结束的时间
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getYestdateEndToString(String format) {
		return format(getYesTodayEnd(), format);
	}

	/**
	 * 获取昨天开始的时间
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getYestdateStartToString(String format) {
		return format(getYesToday(), format);
	}

	/**
	 * 获取7天开始的时间
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getPreSevendayToString(String format) {
		return format(getPreSevenday(), format);
	}

	/**
	 * 返回昨天日期
	 * 
	 * @param format
	 *            时间格式
	 * @return 时间的字符串格式
	 */
	public static String getYesTodayToString(String format) {
		return format(getYesToday(), format);
	}

	/**
	 * 
	 * @return 查询一周时间格式
	 */
	public static String getWEEK() {
		return getPreSevendayToString(TO_MINUTE_N) + DATA_SEPARATE
				+ getTodayEndToString(TO_MINUTE_N);
	}

	/**
	 * 
	 * @return 查询今天时间格式
	 */
	public static String getTODAY() {
		return getTodayStartToString(TO_MINUTE_N) + DATA_SEPARATE
				+ getTodayEndToString(TO_MINUTE_N);
	}

	/**
	 * 
	 * @return 查询昨天时间格式
	 */
	public static String getYESTODAY() {
		return getYesTodayToString(TO_MINUTE_N) + DATA_SEPARATE
				+ getTodayStartToString(TO_MINUTE_N);
	}

	/**
	 * 生成指定时间从开始时间到结束时间的查询格式
	 * 
	 * @param datetime
	 *            传入的指定时间
	 * @return 返回查询索引格式的 时间查询条件
	 */
	public static String getCUSTOMDATE(String datetime) {
		return format(getDateStart(datetime), TO_MINUTE_N) + DATA_SEPARATE
				+ format(getDateEnd(datetime), TO_MINUTE_N);
	}

	/**
	 * 生成指定时间从开始时间到结束时间的查询格式
	 * 
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @return 返回查询索引格式的 时间查询条件
	 */
	public static String getCUSTOMDATE(String beginDate, String endDate) {
		return format(getDateStart(beginDate), TO_MINUTE_N) + DATA_SEPARATE
				+ format(getDateEnd(endDate), TO_MINUTE_N);
	}

	/**
	 * 生成指定时间从开始时间到结束时间的查询格式
	 * 
	 * @param beginDate
	 *            开始时间
	 * @param endDate
	 *            结束时间
	 * @return 返回查询索引格式的 时间查询条件
	 */
	public static String getCUSTOMDATE(Date beginDate, Date endDate) {
		return format(beginDate, TO_MINUTE_N) + DATA_SEPARATE
				+ format(endDate, TO_MINUTE_N);
	}

	/**
	 * 判断两个Date大小
	 * 
	 * @param date
	 *            传入时间
	 * @param fromdate
	 *            待比较时间
	 * @return 如果date大于fromdate 返回true 否则返回false
	 */
	public static boolean dataCompare(Date date, Date fromdate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		Calendar fromcal = Calendar.getInstance();
		fromcal.setTime(fromdate);
		if (cal.compareTo(fromcal) < 0) {
			return false;
		}
		if (cal.compareTo(fromcal) >= 0) {
			return true;
		}
		return false;
	}

	/**
	 * 时间格式转换
	 * 
	 * @param dateStr
	 *            时间字符串
	 * @param formatbegin
	 *            原格式
	 * @param formatend
	 *            目标格式
	 * @return 时间目标格式字符串
	 */
	public static String changeFormat(String dateStr, String formatbegin,
			String formatend) {
		SimpleDateFormat fortmat = new SimpleDateFormat(formatbegin);
		Date date = null;
		try {
			date = fortmat.parse(dateStr);
			SimpleDateFormat fortmat2 = new SimpleDateFormat(formatend);
			return fortmat2.format(date);
		} catch (ParseException e) {
			logger.error("字符串转换为date类型出错", e);
			return "";
		}
	}

	/**
	 * 开始时间
	 * 
	 * @param date
	 *            时间
	 * @return 开始的时间
	 */
	public static Date getStartData(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 结束时间
	 * 
	 * @param date
	 *            时间
	 * @return 结束的时间
	 */
	public static Date getEndData(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 59);
		// cal.add(Calendar.DATE, 1);
		return cal.getTime();
	}

	/**
	 * 结束时间
	 * 
	 * @param date
	 *            时间
	 * @return 结束的时间
	 */
	public static Date getTodayBulletinStartData(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 00);
		cal.set(Calendar.MINUTE, 00);
		cal.set(Calendar.SECOND, 00);
		cal.set(Calendar.MILLISECOND, 00);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * 结束时间
	 * 
	 * @param date
	 *            时间
	 * @return 结束的时间
	 */
	public static Date getTodayBulletinEndData(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 8);
		cal.set(Calendar.MINUTE, 30);
		cal.set(Calendar.SECOND, 00);
		cal.set(Calendar.MILLISECOND, 00);
		return cal.getTime();
	}

	

//	/**
//	 * 判断传入时间是否是同一天
//	 * 
//	 * @param fromdate
//	 *            比较日期
//	 * @param todate
//	 *            待比较日期
//	 * @return 是为true 否为false
//	 */
//	public static boolean isSameDay(Date fromdate, Date todate) {
//		String fromdatestring = coo.base.util.DateUtils.format(fromdate);
//		String todatestring = coo.base.util.DateUtils.format(todate);
//		if (fromdatestring.equals(todatestring)) {
//			return true;
//		}
//		return false;
//	}

	/**
	 * 获取今天是一个星期的天数
	 * 
	 * @return 星期日到今天的天数
	 */
	@SuppressWarnings("static-access")
	public static int dayForWeek() {
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		return c.get(c.DAY_OF_WEEK);
	}

	/**
	 * 获取今天是一个月的第几天
	 * 
	 * @return 每月1号到今天的天数
	 */
	@SuppressWarnings("static-access")
	public static int dayForMonth() {
		Calendar c = Calendar.getInstance();
		return c.get(c.DAY_OF_MONTH);
	}

	/**
	 * 获取今天是一年的第几个星期
	 * 
	 * @return 今天是一年的周数
	 */
	@SuppressWarnings("static-access")
	public static int weekForYear() {
		Calendar c = Calendar.getInstance();
		return c.get(c.WEEK_OF_YEAR);
	}

	/**
	 * 获取今天是一年的第几天
	 * 
	 * @return 一年的第几天
	 */
	@SuppressWarnings("static-access")
	public static int dayForYear() {
		Calendar c = Calendar.getInstance();
		return c.get(c.DAY_OF_YEAR);
	}

	/**
	 * 获取今天是一年的第几天 dateTime格式：yyyy-MM-dd
	 * 
	 * @param dateTime
	 *            日期字符串
	 * @return 一年的第几天
	 */
	@SuppressWarnings("static-access")
	public static int dayForYear(String dateTime) {
		Calendar c = Calendar.getInstance();
		Date date = DateUtils.parse(dateTime, TO_DATE);
		c.setTime(date);
		return c.get(c.DAY_OF_YEAR);
	}

	/**
	 * 获取今天是在一年的第几个月
	 * 
	 * @return 一年的第几个月
	 */
	public static int monthForYear() {
		java.text.Format mm = new SimpleDateFormat("MM");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		String mmDate = mm.format(c.getTime());
		Integer mmInt = Integer.valueOf(mmDate);
		return mmInt;
	}

	/**
	 * 获取一周天数列表
	 * 
	 * @param format
	 *            时间格式
	 * @return 一周天数列表
	 */
	public static List<String> getIndexPathForWeek(String format) {
		List<String> dateStrList = new ArrayList<String>();
		java.text.Format yyyymmdd = new SimpleDateFormat(format);
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		// 7天前
		c.add(Calendar.DATE, -7);

		for (int i = 1; i < 8; i++) {
			// 时间加一天
			c.add(Calendar.DATE, 1);
			String yyyymmddDate = yyyymmdd.format(c.getTime());
			dateStrList.add(yyyymmddDate);
		}
		return dateStrList;
	}

	/**
	 * 根据某一天获取所属的本周 星期一的日期
	 * 
	 * @param date
	 *            某一天日期时间
	 * @return 所属的本周 星期一的日期
	 */
	public static Date createWeekofdayToMonday(Date date) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return calendar.getTime();
	}

	/**
	 * 根据某一天获取所属的本周 星期天的日期
	 * 
	 * @param date
	 *            某一天日期时间
	 * @return 所属的本周 星期一的日期
	 */
	public static Date createWeekofdayToSunday(Date date) {
		Date tmpdate = createWeekofdayToMonday(date);
		Date adddate = addDate(tmpdate, 6);
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setTime(adddate);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 59);
		return calendar.getTime();
	}

	/**
	 * 根据某一天获取所属的本月第一天日期
	 * 
	 * @param date
	 *            某一天日期时间
	 * @return 所属的本周 星期一的日期
	 */
	public static Date createMonthofdayToFirstDay(Date date) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 根据某一天获取所属的本月最后一天日期
	 * 
	 * @param date
	 *            某一天日期时间
	 * @return 所属的本周 星期一的日期
	 */
	public static Date createMonthofdayToLastDay(Date date) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 59);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 返回上周 周一日期
	 * 
	 * @param date
	 *            当前时间
	 * @return 周一日期
	 */
	public static Date createPreviousToMonday(Date date) {
		Date pdate = createWeekofdayToMonday(date);
		return addDate(pdate, -7);
	}

	/**
	 * 返回上周 周日日期
	 * 
	 * @param date
	 *            当前时间
	 * @return 周日日期
	 */
	public static Date createPreviousToSunday(Date date) {
		Date pdate = createWeekofdayToMonday(date);
		pdate = addDate(pdate, -1);
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.setTime(pdate);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 59);
		return calendar.getTime();
	}

	/**
	 * 返回前五周 周一日期
	 * 
	 * @param date
	 *            当前时间
	 * @return 周一日期
	 */
	public static Date createFiveweekToMonday(Date date) {
		Date pdate = createWeekofdayToMonday(date);
		return addDate(pdate, -35);
	}

	/**
	 * 返回前五周 周日日期
	 * 
	 * @param date
	 *            当前时间
	 * @return 周日日期
	 */
	public static Date createFiveweekToSunday(Date date) {
		return createWeekofdayToSunday(date);
	}
	
	/**
	 * 将long型转换为date型
	 * @param number 时间值
	 * @return
	 */
	public static String convertLongToDate(long number){
		Date  date= new Date(number);
		return format(date,TO_SECOND);
	}
	
    
}
