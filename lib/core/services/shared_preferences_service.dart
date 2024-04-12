import 'package:monirth_memories/core/logger.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SharedPreferencesService {
  Logger log = getLogger('SharedPreferencesService');
  static SharedPreferencesService? _instance;

  static Future<SharedPreferencesService> getInstance({
    bool enableLogs = false,
  }) async {
    _instance ??= SharedPreferencesService._(
      await SharedPreferences.getInstance(),
      enableLogs,
    );

    return _instance!;
  }

  final bool enableLogs;
  final SharedPreferences _preferences;
  SharedPreferencesService._(
    this._preferences,
    this.enableLogs,
  );

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic getFromDisk(String key) {
    var value = _preferences.get(key);
    if (enableLogs) log.v('key:$key value:$value');
    return value;
  }

  void saveToDisk(String key, dynamic content) {
    if (enableLogs) log.v('key:$key value:$content');

    if (content == null) {
      _preferences.remove(key);
      return;
    }

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}