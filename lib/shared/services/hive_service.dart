import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String userBoxName = 'userBox';

  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox(userBoxName);
  }

  Box<dynamic> getUserBox() {
    return Hive.box(userBoxName);
  }

  Future<void> putData(String boxName, String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  dynamic getData(String boxName, String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }
}
