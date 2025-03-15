import 'package:cofrinho_app/app/routers/app_routers.dart';
import 'package:cofrinho_app/l10n/app_localizations.dart';
import 'package:cofrinho_app/shared/themes/app_gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/strings/app_string_svg.dart';
import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppGaps.large),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: AppStringSvg.welcomeIllustration,
                      child: SvgPicture.asset(
                        AppStringSvg.welcomeIllustration,
                        width: AppSizes.illustrationLarge,
                      ),
                    ),
                    Column(
                      children: [
                        Text(AppLocalizations.welcomeTitle,
                            style: Theme.of(context).textTheme.displayMedium),
                        Text(
                          AppLocalizations.appTitle,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppGaps.large),
                    Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.welcomeMessage,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppGaps.large,
                  right: AppGaps.large,
                  left: AppGaps.large,
                  bottom: AppGaps.extraLarge),
              child: SizedBox(
                height: AppSizes.buttonHeight,
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(AppRoutes.nome);
                  },
                  child: const Text(AppLocalizations.toStart),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
