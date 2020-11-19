library lx_moment;

enum Format {
  DEFAULT,
  NORMAL,
  YEAR_MONTH_DAY_HOUR_MINUTE,
  YEAR_MONTH_DAY_HOUR,
  YEAR_MONTH_DAY,
  YEAR_MONTH,
  MONTH_DAY_HOUR_MINUTE_SECOND_MIN,
  MONTH_DAY_HOUR_MINUTE_SECOND,
  MONTH_DAY_HOUR_MINUTE,
  MONTH_DAY,
  HOUR_MINUTE_SECOND_MIN,
  HOUR_MINUTE_SECOND,
  HOUR_MINUTE
}

enum Delimiter { oblique, cross }

enum Lang { en, zh }

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

class LxMoment {
  static _getFill(int n) {
    return n < 10 ? '0$n' : '$n';
  }

  static _isLeap(y) {
    return (y % 4 == 0 && y % 100 != 0 || y % 400 == 0) ? 1 : 0;
  }

  static getMonthDay(int y) {
    return {
      1: 31,
      2: 28 + _isLeap(y),
      3: 31,
      4: 30,
      5: 31,
      6: 30,
      7: 31,
      8: 31,
      9: 30,
      10: 31,
      11: 30,
      12: 31
    };
  }

  /*
  * @params dynamic d 动态类型：可传递时间格式字符串，或 DateTime
  * @params enum lang  en:英文格式，zh: 中文格式
  * */
  static String format( dynamic d, {
        Lang lang: Lang.en,
        Delimiter delimiter: Delimiter.cross,
        Format format: Format.DEFAULT,
        bool isLocal: true
      }
    ) {
    List values = List();
    List keys = List();
    switch(lang) {
      case Lang.en:
        values = MomentTools.enTools.values.toList();
        keys = MomentTools.enTools.keys.toList();
        break;
      case Lang.zh:
        values = MomentTools.zhTools.values.toList();
        keys = MomentTools.zhTools.keys.toList();
        break;
    }

    int len = values.length;
    String tools = "";
    for(int i = 0; i< len;i++) {
      if(format == values[i]) {
        tools = keys[i];
        break;
      }
    }

    DateTime tempTime = getDateTime(d, isLocal: isLocal);
    return _replace(tools ?? "HH:mm", tempTime);
  }

  static _replace(String format, DateTime d) {
    print("format: $format");
    return format.replaceAllMapped(RegExp(r'yyyy|MM|dd|HH|mm|ss|mi'), (Match m) {
      print("match: ${m.group(0)} ${d.microsecond}");
      Map<String, String> groups = {
        "yyyy": _getFill(int.parse('${d.year}')),
        "MM": _getFill(int.parse('${d.month}')),
        "dd": _getFill(int.parse('${d.day}')),
        "HH": _getFill(int.parse('${d.hour}')),
        "mm": _getFill(int.parse('${d.minute}')),
        "ss": _getFill(int.parse('${d.second}')),
        "mi":'${d.millisecond == 0? '000': '${d.millisecond}'}'
      };
      return groups[m.group(0)];
    });
  }

  static getDateTime(dynamic d, { bool isLocal = false }) {

    try {
      DateTime dateTime = DateTime.now();
      if(d is String) {
        dateTime = DateTime.tryParse(d);
      } else if(d is DateTime) {
        dateTime = d;
      }
      if (isLocal) return dateTime.toLocal();
      return dateTime.toUtc();
    } catch (e) {
      throw e;
    }
  }

  // 开始时间是否在结束时间之后
  static bool isAfter (dynamic start, dynamic end) {
    try {
      return getDateTime(start).isAfter(getDateTime(end));
    } catch (e) {
      throw e;
    }
  }
  // 开始时间是否在结束时间之前
  static bool isBefore (dynamic start, dynamic end) {
    try {
      return getDateTime(start).isBefore(getDateTime(end));
    } catch (e) {
      throw e;
    }
  }
}
