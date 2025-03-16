import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_corners.dart';
import '../../../../../shared/themes/app_gaps.dart';

class StackedCardWidget extends StatelessWidget {
  const StackedCardWidget({
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
        color: isSelected
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.surfaceContainer,
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
