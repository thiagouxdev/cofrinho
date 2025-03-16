import 'package:piggy_bank_app/app/routers/app_routers.dart';
import 'package:piggy_bank_app/main.dart';
import 'package:piggy_bank_app/shared/services/hive_service.dart';
import 'package:piggy_bank_app/shared/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum NomeState { initial, loading, loaded }

class NomeViewModel extends ChangeNotifier {
  final HiveService _hiveService;
  final SharedPreferencesService _sharedPreferencesService;
  NomeState _state = NomeState.initial;
  NomeState get state => _state;

  NomeViewModel(this._hiveService, this._sharedPreferencesService);

  Future<void> saveNameAndCompleteOnboarding(
      String name, BuildContext context) async {
    _state = NomeState.loading;
    notifyListeners();
    await _hiveService.putData(HiveService.userBoxName, 'name', name);
    await _sharedPreferencesService.setHasCompletedOnboarding(true);
    if (context.mounted) {
      context.go(AppRoutes.newCofrinho);
    }
    _state = NomeState.loaded;
    notifyListeners();
  }
}

final nomeViewModelProvider = ChangeNotifierProvider((ref) => NomeViewModel(
    ref.read(hiveServiceProvider), ref.read(sharedPreferencesServiceProvider)));
