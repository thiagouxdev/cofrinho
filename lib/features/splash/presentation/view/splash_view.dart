import 'package:confrinho_app/shared/themes/app_gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/splash_view_model.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashViewModelProvider);
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Placeholder()),
            Padding(
              padding: EdgeInsets.only(bottom: AppGaps.large),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
