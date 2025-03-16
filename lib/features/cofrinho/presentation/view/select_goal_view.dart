import 'package:cofrinho_app/l10n/app_localizations.dart';
import 'package:cofrinho_app/shared/themes/app_gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';
import '../viewmodel/select_goal_viewmodel.dart';
import 'widgets/stacked_card_widget.dart';

class SelectGoalView extends ConsumerWidget {
  const SelectGoalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(selectGoalViewModelProvider);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text(
                  AppLocalizations.goalCofrinho,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                pinned: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(AppGaps.large),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 100,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final goal = viewModel.goals[index];
                      final isSelected = viewModel.selectedGoalIndex == index;

                      return StackedCardWidget(
                        key: ValueKey(index),
                        isSelected: isSelected,
                        goal: goal,
                        onTap: () => viewModel.selectGoal(index),
                      );
                    },
                    childCount: viewModel.goals.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: AppSizes.buttonHeight +
                      AppGaps.extraLarge +
                      AppGaps.large,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.only(
                top: AppGaps.large,
                right: AppGaps.large,
                left: AppGaps.large,
                bottom: AppGaps.extraLarge,
              ),
              child: SizedBox(
                height: AppSizes.buttonHeight,
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: viewModel.isGoalSelected
                      ? viewModel.continueProcess
                      : null,
                  child: const Text(AppLocalizations.continueProcess),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
