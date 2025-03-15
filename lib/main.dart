import 'package:flutter/material.dart';
import 'package:cofrinho_app/app/routers/app_views.dart';
import 'package:cofrinho_app/shared/services/hive_service.dart';
import 'package:cofrinho_app/shared/services/shared_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveService = HiveService();
  await hiveService.init();
  final sharedPreferencesService = SharedPreferencesService();

  runApp(
    ProviderScope(
      overrides: [
        hiveServiceProvider.overrideWithValue(hiveService),
        sharedPreferencesServiceProvider
            .overrideWithValue(sharedPreferencesService),
        goRouterProvider.overrideWithValue(goRouter), // Provide goRouter
      ],
      child: const MyApp(),
    ),
  );
}

// Providers
final hiveServiceProvider =
    Provider<HiveService>((ref) => throw UnimplementedError());
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());
final goRouterProvider =
    Provider<GoRouter>((ref) => throw UnimplementedError());
