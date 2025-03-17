import 'package:flutter/material.dart';
import 'package:piggy_bank_app/app/routers/app_views.dart';
import 'package:piggy_bank_app/shared/services/hive_service.dart';
import 'package:piggy_bank_app/shared/services/shared_preferences_service.dart';
import 'package:piggy_bank_app/features/piggy_bank/domain/models/piggy_bank_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveService = HiveService();

  await Hive.initFlutter();
  Hive.registerAdapter(PiggyBankModelAdapter());
  await hiveService.init();

  final sharedPreferencesService = SharedPreferencesService();

  runApp(
    ProviderScope(
      overrides: [
        hiveServiceProvider.overrideWithValue(hiveService),
        sharedPreferencesServiceProvider
            .overrideWithValue(sharedPreferencesService),
        goRouterProvider.overrideWithValue(goRouter),
      ],
      child: const MyApp(),
    ),
  );
}

final hiveServiceProvider =
    Provider<HiveService>((ref) => throw UnimplementedError());
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());
final goRouterProvider =
    Provider<GoRouter>((ref) => throw UnimplementedError());
