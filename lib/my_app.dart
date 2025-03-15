import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routers/app_views.dart';
import 'shared/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: goRouter,
        title: 'Cofrinho',
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
