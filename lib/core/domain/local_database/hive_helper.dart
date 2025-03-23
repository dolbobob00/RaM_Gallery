import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final HiveHelper _instance = HiveHelper._internal();
  static Box? _box;

  factory HiveHelper() {
    return _instance;
  }

  HiveHelper._internal();

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('data');
  }

  static Box get box {
    if (_box == null) {
      throw HiveError('Box not initialized. Call HiveHelper.init() first.');
    }
    return _box!;
  }
}
