import 'package:piggy_bank_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piggy_bank_app/shared/services/hive_service.dart';
import 'package:piggy_bank_app/features/cofrinho/domain/models/cofrinho_model.dart';

final cofrinhoViewModelProvider =
    StateNotifierProvider<CofrinhoViewModel, List<CofrinhoModel>>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  return CofrinhoViewModel(hiveService);
});

class CofrinhoViewModel extends StateNotifier<List<CofrinhoModel>> {
  final HiveService _hiveService;

  CofrinhoViewModel(this._hiveService) : super([]) {
    _loadCofrinhos();
  }

  void _loadCofrinhos() {
    state = _hiveService.getAllCofrinhos();
  }

  Future<void> addCofrinho(CofrinhoModel cofrinho) async {
    await _hiveService.addCofrinho(cofrinho);
    _loadCofrinhos();
  }

  Future<void> removeCofrinho(int index) async {
    await _hiveService.removeCofrinho(index);
    _loadCofrinhos();
  }
}
