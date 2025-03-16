import 'package:hive_flutter/hive_flutter.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/cofrinho_model.dart';

class HiveService {
  static const String userBoxName =
      'userBox'; // ✅ Nome da caixa para armazenar dados do usuário
  static const String cofrinhoBoxName =
      'cofrinhos'; // ✅ Nome da caixa para armazenar os cofrinhos

  /// ✅ Inicializa o Hive e registra os adapters
  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes(); // ✅ Abre as caixas do Hive
  }

  /// ✅ Abre as caixas do Hive para uso
  Future<void> openBoxes() async {
    await Hive.openBox(userBoxName); // ✅ Abre a caixa de dados do usuário
    await Hive.openBox<CofrinhoModel>(
        cofrinhoBoxName); // ✅ Abre a caixa de cofrinhos
  }

  /// ✅ Obtém a caixa de dados do usuário
  Box<dynamic> getUserBox() {
    return Hive.box(userBoxName);
  }

  /// ✅ Obtém a caixa de cofrinhos
  Box<CofrinhoModel> getCofrinhoBox() {
    return Hive.box<CofrinhoModel>(cofrinhoBoxName);
  }

  /// ✅ Salva um valor na caixa especificada
  Future<void> putData(String boxName, String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value); // ✅ Salva os dados com a chave fornecida
  }

  /// ✅ Obtém um valor da caixa pelo nome da caixa e a chave
  dynamic getData(String boxName, String key) {
    final box = Hive.box(boxName);
    return box.get(key); // ✅ Retorna o valor armazenado para a chave fornecida
  }

  /// ✅ Adiciona um novo cofrinho na caixa
  Future<void> addCofrinho(CofrinhoModel cofrinho) async {
    final box = getCofrinhoBox();
    await box.add(cofrinho); // ✅ Adiciona um novo objeto de cofrinho ao Hive
  }

  /// ✅ Retorna a lista de todos os cofrinhos armazenados
  List<CofrinhoModel> getAllCofrinhos() {
    final box = getCofrinhoBox();
    return box.values.toList(); // ✅ Converte os valores da caixa em uma lista
  }

  /// ✅ Remove um cofrinho pelo índice
  Future<void> removeCofrinho(int index) async {
    final box = getCofrinhoBox();
    await box.deleteAt(index); // ✅ Deleta o cofrinho na posição fornecida
  }
}
