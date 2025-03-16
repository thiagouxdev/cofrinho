import 'package:cofrinho_app/main.dart';
import 'package:cofrinho_app/shared/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';

enum NewPiggyBankState { initial, loading, loaded }

class NewPiggyBankViewModel extends ChangeNotifier {
  final HiveService _hiveService;
  String? _userName;
  String? get userName => _userName;
  NewPiggyBankState _state = NewPiggyBankState.initial;
  NewPiggyBankState get state => _state;
  final List<String> _listTitles = [
    AppLocalizations.selectYourGoal,
    AppLocalizations.createYourPiggyBankName,
    AppLocalizations.enterTheValueToReach,
    AppLocalizations.howMuchToAddPerMonth,
    AppLocalizations.everythingReviewedLetsSave,
  ];
  List<String> get listTitles => _listTitles;

  NewPiggyBankViewModel(this._hiveService);

  Future<void> getUserName() async {
    _state = NewPiggyBankState.loading;
    notifyListeners();
    _userName = _hiveService.getData(HiveService.userBoxName, 'name');
    _state = NewPiggyBankState.loaded;
    notifyListeners();
  }

  Future<void> resetOnboarding(WidgetRef ref) async {
    final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
    await sharedPreferencesService.setHasCompletedOnboarding(false);
  }
}

final NewPiggyBankViewModelProvider = ChangeNotifierProvider(
    (ref) => NewPiggyBankViewModel(ref.read(hiveServiceProvider)));
