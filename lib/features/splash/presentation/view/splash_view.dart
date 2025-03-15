import 'package:confrinho_app/features/splash/presentation/viewmodel/splash_view_model.dart';
import 'package:confrinho_app/shared/themes/app_gaps.dart';
import 'package:confrinho_app/shared/themes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/strings/app_string_svg.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(splashViewModelProvider).navigateToNextScreen(context));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashViewModelProvider, (previous, next) {
      if (next.state == SplashState.loaded) {}
    });
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
