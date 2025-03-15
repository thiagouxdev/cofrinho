import 'package:confrinho_app/shared/themes/app_gaps.dart';
import 'package:confrinho_app/shared/themes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/strings/app_string_svg.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: AppStringSvg.welcomeIllustration,
                child: SvgPicture.asset(
                  AppStringSvg.welcomeIllustration,
                  width: AppSizes.illustrationMedium,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: AppGaps.extraLarge),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
