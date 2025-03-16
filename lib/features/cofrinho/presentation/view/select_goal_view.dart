import 'package:cofrinho_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SelectGoalView extends StatefulWidget {
  const SelectGoalView({super.key});

  @override
  State<SelectGoalView> createState() => _SelectGoalViewState();
}

class _SelectGoalViewState extends State<SelectGoalView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(
              AppLocalizations.goalCofrinho,
            ),
          ),
        ],
      ),
    );
  }
}
