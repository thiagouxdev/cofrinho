import 'package:piggy_bank_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piggy_bank_app/shared/services/hive_service.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/piggy_bank_model.dart';

final piggyBankViewModelProvider =
    StateNotifierProvider<PiggyBankViewModel, List<PiggyBankModel>>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  return PiggyBankViewModel(hiveService);
});

class PiggyBankViewModel extends StateNotifier<List<PiggyBankModel>> {
  final HiveService _hiveService;

  PiggyBankViewModel(this._hiveService) : super([]) {
    _loadPiggyBanks();
  }

  void _loadPiggyBanks() {
    state = _hiveService.getAllPiggyBanks();
  }

  Future<void> addPiggyBank(PiggyBankModel piggyBank) async {
    await _hiveService.addPiggyBank(piggyBank);
    _loadPiggyBanks();
  }

  Future<void> removePiggyBank(int index) async {
    await _hiveService.removePiggyBank(index);
    _loadPiggyBanks();
  }
}
