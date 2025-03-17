import 'package:piggy_bank_app/features/piggy_bank/presentation/view/new_piggy_bank_view.dart';
import 'package:piggy_bank_app/features/splash/presentation/view/splash_view.dart';
import 'package:piggy_bank_app/features/welcome/presentation/view/nome_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/piggy_bank/presentation/view/select_goal_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/welcome/presentation/view/welcome_view.dart';
import 'app_routers.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    path: AppRoutes.splash,
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: AppRoutes.welcome,
    builder: (context, state) => const WelcomeView(),
  ),
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: AppRoutes.nome,
    builder: (context, state) => const NomeView(),
  ),
  GoRoute(
    path: AppRoutes.newPiggyBank,
    builder: (context, state) => const NewPiggyBankView(),
  ),
  GoRoute(
    path: AppRoutes.objective,
    builder: (context, state) => const SelectGoalView(),
  ),
];

final goRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: appRoutes,
);
