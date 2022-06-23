import 'package:fooddelivery/shared/server/errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<bool> has(String key);

  Future<bool> clear(String key);

  dynamic getData({
    required String key,
  });

  Future<bool> saveData({
    required String key,
    required dynamic value,
  });
}

class CacheImpl extends CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheImpl(this._sharedPreferences);

  @override
  Future<bool> has(String key) async {
    final bool f = await _basicErrorHandling(() async {
      return _sharedPreferences.containsKey(key) &&
          _sharedPreferences.getString(key)!.isNotEmpty;
    });
    return f;
  }

  @override
  Future<bool> clear(String key) async {
    final bool f = await _basicErrorHandling(() async {
      return await _sharedPreferences.remove(key);
    });
    return f;
  }

  dynamic getData({
    required String key,
  }) {
    return _sharedPreferences.get(key);
  }

  @override
  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);

    return await _sharedPreferences.setDouble(key, value);
  }
}

/// extension on {type}
extension on CacheHelper {
  Future<T> _basicErrorHandling<T>(Future<T> onSuccess()) async {
    try {
      final f = await onSuccess();
      return f;
    } catch (e) {
//      print(e);
      throw CacheException();
    }
  }
}
