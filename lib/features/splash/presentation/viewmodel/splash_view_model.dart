import 'package:confrinho_app/app/routers/app_routers.dart';
import 'package:confrinho_app/main.dart';
import 'package:confrinho_app/shared/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum SplashState { initial, loading, loaded }

class SplashViewModel extends ChangeNotifier {
  final SharedPreferencesService _sharedPreferencesService;
  SplashState _state = SplashState.initial;
  SplashState get state => _state;

  SplashViewModel(this._sharedPreferencesService);

  Future<void> navigateToNextScreen(BuildContext context) async {
    _state = SplashState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    final hasCompletedOnboarding =
        await _sharedPreferencesService.getHasCompletedOnboarding();

    if (context.mounted) {
      context.go(
          hasCompletedOnboarding ? AppRoutes.newCofrinho : AppRoutes.welcome);
    }
    _state = SplashState.loaded;
    notifyListeners();
  }
}

final splashViewModelProvider = ChangeNotifierProvider(
    (ref) => SplashViewModel(ref.read(sharedPreferencesServiceProvider)));
