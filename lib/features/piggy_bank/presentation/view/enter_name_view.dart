import 'package:piggy_bank_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EnterNameView extends StatefulWidget {
  const EnterNameView({super.key});

  @override
  State<EnterNameView> createState() => _EnterNameViewState();
}

class _EnterNameViewState extends State<EnterNameView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(AppLocalizations.namePiggyBank),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
