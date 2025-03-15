import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routers/app_routers.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/themes/app_gaps.dart';
import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';

class NomeView extends StatefulWidget {
  const NomeView({super.key});

  @override
  State<NomeView> createState() => _NomeViewState();
}

class _NomeViewState extends State<NomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.pop();
              },
            ),
            pinned: true,
            title: Text(
              AppLocalizations.nameTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(AppGaps.large),
                      child: TextField()),
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
                        context.go(AppRoutes.nome);
                      },
                      child: const Text(AppLocalizations.continueProcess),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
