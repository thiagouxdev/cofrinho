import 'package:hive/hive.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/piggy_bank_model.dart';
import 'package:uuid/uuid.dart';

class PiggyBankRepository {
  static const String _boxName = 'piggyBankBox';
  final Uuid _uuid = const Uuid();

  // Incializa o hive e resistrar o adapter
  Future<void> init() async {
    Hive.registerAdapter(PiggyBankModelAdapter());
    await Hive.openBox<PiggyBankModel>(_boxName);
  }

  // Obter a box do cofrinho
  Box<PiggyBankModel> getPiggyBankBox() {
    return Hive.box<PiggyBankModel>(_boxName);
  }

  // Listar todos os cofrinhos
  List<PiggyBankModel> getAllPiggyBank() {
    final box = getPiggyBankBox();
    return box.values.toList();
  }

  // Buscar cofrinho por id
  PiggyBankModel? _getPiggyBankById(String id) {
    final box = getPiggyBankBox();
    for (final element in box.values) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
  }

  // Salva um novo cofrinho
  Future<String> savePiggyBank(PiggyBankModel piggyBank) async {
    final box = getPiggyBankBox();

    if (piggyBank.id.isEmpty) {
      piggyBank.id = _uuid.v4();
    }

    await box.put(piggyBank.id, piggyBank);
    return piggyBank.id;
  }

  // Atualiza um cofrinho
  Future<void> updatePiggyBank(PiggyBankModel piggyBank) async {
    final box = getPiggyBankBox();
    await box.put(piggyBank.id, piggyBank);
  }

  // Adicionar valor ao cofrinho
  Future<void> addValuePiggyBank(String piggyId, double value) async {
    final piggyBank = _getPiggyBankById(piggyId);
    if (piggyBank != null) {
      piggyBank.currentAmount += value;
      await updatePiggyBank(piggyBank);
    }
  }

  // Deleta um cofrinho
  Future<void> deletePiggBank(String piggyBankId) async {
    final box = getPiggyBankBox();
    await box.delete(piggyBankId);
  }
}
