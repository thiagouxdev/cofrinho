import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:piggy_bank_app/l10n/app_localizations.dart';

import '../../../../app/routers/app_routers.dart';
import '../../../../shared/services/hive_service.dart';

final selectGoalViewModelProvider = Provider((ref) => SelectGoalViewModel(ref));
final selectedGoalProvider = StateProvider<int?>((ref) => null);

class SelectGoalViewModel {
  final Ref _ref;

  SelectGoalViewModel(this._ref);

  int? get selectedGoalIndex => _ref.watch(selectedGoalProvider);

  void selectGoal(int index) {
    _ref.read(selectedGoalProvider.notifier).state = index;
  }

  bool get isGoalSelected => selectedGoalIndex != null;

  List<Map<String, dynamic>> get goals => [
        {
          'icon': Symbols.travel_luggage_and_bags_rounded,
          'label': AppLocalizations.goalTravel
        },
        {
          'icon': Symbols.directions_car_rounded,
          'label': AppLocalizations.goalCar
        },
        {
          'icon': Symbols.two_wheeler_rounded,
          'label': AppLocalizations.goalMotorcycle
        },
        {
          'icon': Symbols.smartphone_rounded,
          'label': AppLocalizations.goalPhone
        },
        {'icon': Symbols.home_rounded, 'label': AppLocalizations.goalHouse},
        {'icon': Symbols.school_rounded, 'label': AppLocalizations.goalCourse},
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
        {
          'icon': Symbols.savings_rounded,
          'label': AppLocalizations.goalSaveMoney
        },
      ];

  void continueProcess(BuildContext context) async {
    if (isGoalSelected) {
      context.go(AppRoutes.enterName);
    }
  }
}
