import 'package:cofrinho_app/features/welcome/presentation/viewmodel/nome_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/themes/app_gaps.dart';
import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';

class NomeView extends ConsumerStatefulWidget {
  const NomeView({super.key});

  @override
  NomeViewState createState() => NomeViewState();
}

class NomeViewState extends ConsumerState<NomeView> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(AppGaps.large),
                      child: TextField(
                        autofocus: true,
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: AppLocalizations.nameHint,
                        ),
                      )),
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
                        ref
                            .read(nomeViewModelProvider)
                            .saveNameAndCompleteOnboarding(
                                nameController.text, context);
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
