import 'lx_moment_format.dart';

class MomentTools {
  static Map<String, Format> enTools =  {
    "yyyy-MM-dd HH:mm:ss.mi": Format.DEFAULT,
    "yyyy-MM-dd HH:mm:ss": Format.NORMAL,
    "yyyy-MM-dd HH:mm": Format.YEAR_MONTH_DAY_HOUR_MINUTE,
    "yyyy-MM-dd HH": Format.YEAR_MONTH_DAY_HOUR,
    "yyyy-MM-dd": Format.YEAR_MONTH_DAY,
    "yyyy-MM": Format.YEAR_MONTH,
    "MM-dd HH:mm:ss.mi": Format.MONTH_DAY_HOUR_MINUTE_SECOND_MIN,
    "MM-dd HH:mm:ss": Format.MONTH_DAY_HOUR_MINUTE_SECOND,
    "MM-dd HH:mm": Format.MONTH_DAY_HOUR_MINUTE,
    "MM-dd": Format.MONTH_DAY,
    "HH:mm:ss.mi": Format.HOUR_MINUTE_SECOND_MIN,
    "HH:mm:ss": Format.HOUR_MINUTE_SECOND,
    "HH:mm": Format.HOUR_MINUTE
  };

  static Map<String, Format> zhTools = {
    "yyyy年MM月dd日 HH时mm分ss秒mi": Format.DEFAULT,
    "yyyy年MM月dd日 HH时mm分ss秒": Format.NORMAL,
    "yyyy年MM月dd日 HH时mm分": Format.YEAR_MONTH_DAY_HOUR_MINUTE,
    "yyyy年MM月dd日 HH时": Format.YEAR_MONTH_DAY_HOUR,
    "yyyy年MM月dd日": Format.YEAR_MONTH_DAY,
    "yyyy年MM月": Format.YEAR_MONTH,
    "MM月dd日 HH时mm分ss秒mi": Format.MONTH_DAY_HOUR_MINUTE_SECOND_MIN,
    "MM月dd日 HH时mm分ss秒": Format.MONTH_DAY_HOUR_MINUTE_SECOND,
    "MM月dd日 HH时mm分": Format.MONTH_DAY_HOUR_MINUTE,
    "MM月dd日": Format.MONTH_DAY,
    "HH时mm分ss秒mi": Format.HOUR_MINUTE_SECOND_MIN,
    "HH时mm分ss秒": Format.HOUR_MINUTE_SECOND,
    "HH时mm分": Format.HOUR_MINUTE
  };

}