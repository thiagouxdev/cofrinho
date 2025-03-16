import 'package:cofrinho_app/l10n/app_localizations.dart';
import 'package:cofrinho_app/shared/themes/app_corners.dart';
import 'package:cofrinho_app/shared/themes/app_gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';

final selectedGoalProvider = StateProvider<int?>((ref) => null);

class SelectGoalView extends ConsumerWidget {
  const SelectGoalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoalIndex = ref.watch(selectedGoalProvider);
    final List<Map<String, dynamic>> goals = [
      {
        'icon': Symbols.travel_luggage_and_bags_rounded,
        'label': AppLocalizations.goalTravel
      },
      {'icon': Symbols.directions_car, 'label': AppLocalizations.goalCar},
      {
        'icon': Symbols.two_wheeler_rounded,
        'label': AppLocalizations.goalMotorcycle
      },
      {'icon': Symbols.smartphone_rounded, 'label': AppLocalizations.goalPhone},
      {'icon': Symbols.home, 'label': AppLocalizations.goalHouse},
      {'icon': Symbols.school, 'label': AppLocalizations.goalCourse},
      {
        'icon': Symbols.tools_power_drill_rounded,
        'label': AppLocalizations.goalRenovation
      },
      {
        'icon': Symbols.stethoscope_rounded,
        'label': AppLocalizations.goalMedical
      },
      {
        'icon': Symbols.featured_seasonal_and_gifts_rounded,
        'label': AppLocalizations.goalGift
      },
      {'icon': Symbols.savings, 'label': AppLocalizations.goalSaveMoney},
    ];

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
                      final goal = goals[index];
                      final isSelected = selectedGoalIndex == index;

                      return GestureDetector(
                        key: ValueKey(index),
                        onTap: () {
                          ref.read(selectedGoalProvider.notifier).state = index;
                        },
                        child: StackedCard(isSelected: isSelected, goal: goal),
                      );
                    },
                    childCount: goals.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                    height: AppSizes.buttonHeight +
                        AppGaps.extraLarge +
                        AppGaps.large),
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
                  onPressed: selectedGoalIndex != null ? () {} : null,
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

class StackedCard extends StatelessWidget {
  const StackedCard({
    super.key,
    required this.isSelected,
    required this.goal,
  });

  final bool isSelected;
  final Map<String, dynamic> goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppGaps.medium,
        horizontal: AppGaps.large,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppCorners.large),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Icon(
              goal['icon'],
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fill: isSelected ? 1.0 : 0.0,
            ),
          ),
          Text(
            goal['label'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
