import 'dart:html';

import 'package:get_storage/get_storage.dart';

class Manager {
  static GetStorage _getStorage = GetStorage();
  // GetStorage getStorage = GetStorage();

  /// this method will be use to save api response data
  static Future saveId({id}) async {
    await _getStorage.write('userId', id);
  }

  ///this method will be use to read sharedpreference key
  static String idRead() {
    return _getStorage.read('userId');
  }

  /// this method will be use in single saved sharedpreference id removed
  removeuserid() {
    return _getStorage.remove('userId');
  }

  ///this method will be use to all sharedpreference save data to clear
  allSharedPreferenceDataRemoved() {
    return _getStorage.erase();
  }
}
