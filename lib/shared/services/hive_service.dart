import 'package:hive_flutter/hive_flutter.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/piggy_bank_model.dart';

class HiveService {
  static const String userBoxName =
      'userBox'; // Nome da caixa para armazenar dados do usuário
  static const String piggyBankBoxName =
      'piggyBanks'; // Nome da caixa para armazenar os piggy banks

  /// Inicializa o Hive e registra os adapters
  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes(); // Abre as caixas do Hive
  }

  /// Abre as caixas do Hive para uso
  Future<void> openBoxes() async {
    await Hive.openBox(userBoxName); // Abre a caixa de dados do usuário
    await Hive.openBox<PiggyBankModel>(
        piggyBankBoxName); // Abre a caixa de piggy banks
  }

  /// Obtém a caixa de dados do usuário
  Box<dynamic> getUserBox() {
    return Hive.box(userBoxName);
  }

  /// Obtém a caixa de piggy banks
  Box<PiggyBankModel> getPiggyBankBox() {
    return Hive.box<PiggyBankModel>(piggyBankBoxName);
  }

  /// Salva um valor na caixa especificada
  Future<void> putData(String boxName, String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value); // Salva os dados com a chave fornecida
  }

  /// Obtém um valor da caixa pelo nome da caixa e a chave
  dynamic getData(String boxName, String key) {
    final box = Hive.box(boxName);
    return box.get(key); // Retorna o valor armazenado para a chave fornecida
  }

  /// Adiciona um novo piggy bank na caixa
  Future<void> addPiggyBank(PiggyBankModel piggyBank) async {
    final box = getPiggyBankBox();
    await box.add(piggyBank); // Adiciona um novo objeto de piggy bank ao Hive
  }

  /// Retorna a lista de todos os piggy banks armazenados
  List<PiggyBankModel> getAllPiggyBanks() {
    final box = getPiggyBankBox();
    return box.values.toList(); // Converte os valores da caixa em uma lista
  }

  /// Remove um piggy bank pelo índice
  Future<void> removePiggyBank(int index) async {
    final box = getPiggyBankBox();
    await box.deleteAt(index); // Deleta o piggy bank na posição fornecida
  }
}
