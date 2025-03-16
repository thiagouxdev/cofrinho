import 'package:cofrinho_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ObjectiveView extends StatefulWidget {
  const ObjectiveView({super.key});

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(
              AppLocalizations.objectiveCofrinho,
            ),
          )
        ],
      ),
    );
  }
}
