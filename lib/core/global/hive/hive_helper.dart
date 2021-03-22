import 'package:crokett/core/global/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class HiveHelper {

  /// FirstLaunch

  static Future<bool> showOnBoarding() async {
    final box = await Hive.openBox(Constants.hiveFirstLaunchOfApp);
    bool value = box.get(Constants.hiveShowOnboarding);
    box.close();
    return Future.value(value); // Might be able to just use ......  "return value"
  }

  static Future<void> setShowOnBoarding() async {
    final box = Hive.box(Constants.hiveFirstLaunchOfApp);
    box.put(Constants.hiveShowOnboarding, false);
    box.close();
  }

  /// Token

  static Future<void> deleteToken() async {
    await Hive.openBox(Constants.hiveUserToken).then((t) {
      t.deleteAt(0);
    });
    Hive.close();
    return;
  }

  static Future<void> persistToken(String token) async {
    await Hive.openBox(Constants.hiveUserToken).then((t) {
      t.put(0, token);
    });
    Hive.close();
    return;
  }

  static Future<String> getToken() async {
    String token;
    await Hive.openBox(Constants.hiveUserToken).then((mp) {
      token = mp.get(0); // This could be 2 associated with hive type?
    });
    Hive.close();
    return token;
  }

  /// Token

}
