import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPrefUtil {
  static Future<bool> setValue(
    PrefType type,
    PrefKey key,
    dynamic value,
  ) async {
    final pref = await SharedPreferences.getInstance();
    switch (type) {
      case PrefType.BOOL:
        return await pref.setBool(key.toString(), value as bool);
        break;
      case PrefType.INT:
        return await pref.setInt(key.toString(), value as int);
        break;
      case PrefType.STRING:
        return await pref.setString(key.toString(), value as String);
        break;
      case PrefType.DOUBLE:
        return await pref.setDouble(key.toString(), value as double);
        break;
      case PrefType.STRING_LIST:
        return await pref.setStringList(key.toString(), value as List<String>);
        break;
      default:
        return false;
        break;
    }
  }

  static Future<String> getString(PrefKey key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key.toString());
  }

  static Future<bool> remove(PrefKey key) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(key.toString());
  }

  static Future<bool> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }
}

enum PrefType { INT, STRING, DOUBLE, BOOL, STRING_LIST }

enum PrefKey { TOKEN, LANGUAGE_CODE }
