import 'package:hive_flutter/hive_flutter.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/piggy_bank_model.dart';

class HiveService {
  static const String userBoxName = 'userBox';
  static const String piggyBankBoxName = 'piggyBanks';

  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox(userBoxName);
    await Hive.openBox<PiggyBankModel>(piggyBankBoxName);
  }

  Box<dynamic> getUserBox() {
    return Hive.box(userBoxName);
  }

  Box<PiggyBankModel> getPiggyBankBox() {
    return Hive.box<PiggyBankModel>(piggyBankBoxName);
  }

  Future<void> putData(String boxName, String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  dynamic getData(String boxName, String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  Future<void> addPiggyBank(PiggyBankModel piggyBank) async {
    final box = getPiggyBankBox();
    await box.add(piggyBank);
  }

  List<PiggyBankModel> getAllPiggyBanks() {
    final box = getPiggyBankBox();
    return box.values.toList();
  }

  Future<void> removePiggyBank(int index) async {
    final box = getPiggyBankBox();
    await box.deleteAt(index);
  }
}
