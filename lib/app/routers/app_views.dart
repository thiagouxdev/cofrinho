import 'package:cofrinho_app/features/cofrinho/presentation/view/new_cofrinho_view.dart';
import 'package:cofrinho_app/features/splash/presentation/view/splash_view.dart';
import 'package:cofrinho_app/features/welcome/presentation/view/nome_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/cofrinho/presentation/view/objective_view.dart';
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
    path: AppRoutes.newCofrinho,
    builder: (context, state) => const NewCofrinhoView(),
  ),
  GoRoute(
    path: AppRoutes.objective,
    builder: (context, state) => const ObjectiveView(),
  ),
];

final goRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: appRoutes,
);
