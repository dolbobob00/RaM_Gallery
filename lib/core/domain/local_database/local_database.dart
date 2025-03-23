import 'package:hive_flutter/hive_flutter.dart';
import 'hive_helper.dart';

abstract class ILocalDatabase {
  Future<void> writeData<T>(String key, T data);
 T? readData<T>(String key);
  Future<void> deleteData(String key);
}

class HiveLocalDatabase implements ILocalDatabase {
  final Box _myBox = HiveHelper.box;

  @override
  Future<void> deleteData(String key) async {
    try {
      await _myBox.delete(key);
    } catch (e) {
      print('Error deleting data: $e');
      rethrow;
    }
  }

  @override
 T? readData<T>(String key)  {
    try {
      final data = _myBox.get(key);
      return data as T?;
    } catch (e) {
      print('Error reading data: $e');
      return null;
    }
  }

  @override
  Future<void> writeData<T>(String key, T data) async {
    try {
      await _myBox.put(key, data);
    } catch (e) {
      print('Error writing data: $e');
      rethrow;
    }
  }
}
