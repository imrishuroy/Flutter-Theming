import 'package:shared_preferences/shared_preferences.dart';

class SharedRefs {
  static SharedPreferences? _sharedRefs;

  init() async {
    if (_sharedRefs == null) {
      _sharedRefs = await SharedPreferences.getInstance();
    }
  }
}

final sharedRefs = SharedRefs();
