import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage _getStorage = GetStorage();

  static Future saveId({id}) async {
    await _getStorage.write('userId', id);
  }

  static String idRead() {
    return _getStorage.read('userId');
  }

  static Future saveLoginId({id}) async {
    await _getStorage.write('userId', id);
  }

  static String idloginRead() {
    return _getStorage.read('userId');
  }
}
