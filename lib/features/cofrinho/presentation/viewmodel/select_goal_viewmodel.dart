import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:cofrinho_app/l10n/app_localizations.dart';

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
        {'icon': Symbols.directions_car, 'label': AppLocalizations.goalCar},
        {
          'icon': Symbols.two_wheeler_rounded,
          'label': AppLocalizations.goalMotorcycle
        },
        {
          'icon': Symbols.smartphone_rounded,
          'label': AppLocalizations.goalPhone
        },
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

  void continueProcess() {
    // Lógica para continuar o processo
  }
}
