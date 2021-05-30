import 'package:shared_preferences/shared_preferences.dart';

const String keyTheme = 'theme';

class SharedRefs {
  static SharedPreferences? _sharedRefs;

  factory SharedRefs() => SharedRefs._internal();

  SharedRefs._internal();

  Future<void> init() async {
    if (_sharedRefs == null) {
      _sharedRefs = await SharedPreferences.getInstance();
    }
  }

  bool get checkPrefsNull =>
      _sharedRefs != null && _sharedRefs!.containsKey(keyTheme);

  int get theme => _sharedRefs?.getInt(keyTheme) ?? 0;

  //setTheme

  Future<void> setTheme(int value) async {
    if (_sharedRefs != null) {
      await _sharedRefs?.setInt(keyTheme, value);
    }
  }
}

//final sharedRefs = SharedRefs();
