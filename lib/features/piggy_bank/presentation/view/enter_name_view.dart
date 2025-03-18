import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';

class EnterNameView extends ConsumerStatefulWidget {
  const EnterNameView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EnterNameViewState();
}

class _EnterNameViewState extends ConsumerState<EnterNameView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(AppLocalizations.namePiggyBank),
          )
        ],
      ),
    );
  }
}
