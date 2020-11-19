library lx_moment;

import 'lx_moment_delimiter.dart';
import 'lx_moment_format.dart';
import 'lx_moment_lang.dart';
import 'lx_moment_tools.dart';

class LxMoment {
  static _getFill(int n) {
    return n < 10 ? '0$n' : '$n';
  }

  static int isLeap(y) {
    try {
      return (y % 4 == 0 && y % 100 != 0 || y % 400 == 0) ? 1 : 0;
    } catch (e) {
      throw e;
    }
  }

  static _getMonthDay(int y) {
    return {
      1: 31,
      2: 28 + isLeap(y),
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
  * @params bool isLocal 是否转为本地时间
  * */
  static String format(dynamic d,
      {Lang lang: Lang.en,
      Format format: Format.DEFAULT,
      bool isLocal: true}) {
    List values = List();
    List keys = List();
    switch (lang) {
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
    for (int i = 0; i < len; i++) {
      if (format == values[i]) {
        tools = keys[i];
        break;
      }
    }

    DateTime tempTime = getDateTime(d, isLocal: isLocal);
    return _replace(tempTime, format: tools);
  }

  static String _replace(DateTime d, { String format = 'yyyy-MM-dd HH:mm:ss.mi' }) {
    try {
      return format.replaceAllMapped(RegExp(r'yyyy|MM|dd|HH|mm|ss|mi'),
              (Match m) {
            Map<String, String> groups = {
              "yyyy": _getFill(int.parse('${d.year}')),
              "MM": _getFill(int.parse('${d.month}')),
              "dd": _getFill(int.parse('${d.day}')),
              "HH": _getFill(int.parse('${d.hour}')),
              "mm": _getFill(int.parse('${d.minute}')),
              "ss": _getFill(int.parse('${d.second}')),
              "mi": '${d.millisecond == 0 ? '000' : '${d.millisecond}'}'
            };
            return groups[m.group(0)];
          });
    } catch (e) {
      throw e;
    }
  }

  static DateTime getDateTime(dynamic d, {bool isLocal = false}) {
    try {
      DateTime dateTime = DateTime.now();
      if (d is String) {
        dateTime = DateTime.tryParse(d);
      } else if (d is DateTime) {
        dateTime = d;
      }
      if (isLocal) return dateTime.toLocal();
      return dateTime.toUtc();
    } catch (e) {
      throw e;
    }
  }

  // 开始时间是否在结束时间之后
  static bool isAfter(dynamic start, dynamic end) {
    try {
      return getDateTime(start).isAfter(getDateTime(end));
    } catch (e) {
      throw e;
    }
  }

  // 开始时间是否在结束时间之前
  static bool isBefore(dynamic start, dynamic end) {
    try {
      return getDateTime(start).isBefore(getDateTime(end));
    } catch (e) {
      throw e;
    }
  }
}
