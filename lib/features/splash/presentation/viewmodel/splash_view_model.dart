import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routers/app_routers.dart';
import '../../../../app/routers/app_views.dart';

final splashViewModelProvider = Provider((ref) => SplashViewModel(ref));

class SplashViewModel {
  final Ref ref;

  SplashViewModel(this.ref) {
    navegarParaWelcome();
  }

  void navegarParaWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(routerProvider).go(AppRoutes.welcome);
    });
  }
}

final routerProvider = Provider<GoRouter>((ref) => goRouter);
