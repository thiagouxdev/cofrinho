import 'package:cofrinho_app/main.dart';
import 'package:cofrinho_app/shared/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NewCofrinhoState { initial, loading, loaded }

class NewCofrinhoViewModel extends ChangeNotifier {
  final HiveService _hiveService;
  String? _userName;
  String? get userName => _userName;
  NewCofrinhoState _state = NewCofrinhoState.initial;
  NewCofrinhoState get state => _state;
  final List<String> _listTitles = [
    'Selecione seu objetivo',
    'Crie o nome do seu cofrinho',
    'Título 3',
    'Título 4',
    'Título 5',
  ];
  List<String> get listTitles => _listTitles;

  NewCofrinhoViewModel(this._hiveService);

  Future<void> getUserName() async {
    _state = NewCofrinhoState.loading;
    notifyListeners();
    _userName = _hiveService.getData(HiveService.userBoxName, 'name');
    _state = NewCofrinhoState.loaded;
    notifyListeners();
  }

  Future<void> resetOnboarding(WidgetRef ref) async {
    final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
    await sharedPreferencesService.setHasCompletedOnboarding(false);
  }
}

final newCofrinhoViewModelProvider = ChangeNotifierProvider(
    (ref) => NewCofrinhoViewModel(ref.read(hiveServiceProvider)));
