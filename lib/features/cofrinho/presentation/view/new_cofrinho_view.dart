import 'package:cofrinho_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/strings/app_string_svg.dart';
import '../../../../shared/themes/app_gaps.dart';
import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';
import '../viewmodel/new_cofrinho_view_model.dart';

class NewCofrinhoView extends ConsumerStatefulWidget {
  const NewCofrinhoView({super.key});

  @override
  NewCofrinhoViewState createState() => NewCofrinhoViewState();
}

class NewCofrinhoViewState extends ConsumerState<NewCofrinhoView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(newCofrinhoViewModelProvider).getUserName());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(newCofrinhoViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo ao cofrinho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              final sharedPreferencesService =
                  ref.read(sharedPreferencesServiceProvider);
              await sharedPreferencesService.setHasCompletedOnboarding(false);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                const HeaderFeature(),
                titleFeature(viewModel: viewModel),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.listTitles.length,
                  itemBuilder: (context, index) {
                    return Consumer(
                      builder: (context, ref, child) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLow,
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          title: Text(viewModel.listTitles[index]),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
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
                onPressed: () {},
                child: const Text(AppLocalizations.toStart),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class titleFeature extends StatelessWidget {
  const titleFeature({
    super.key,
    required this.viewModel,
  });

  final NewCofrinhoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppGaps.extraLarge,
        top: AppGaps.large,
        right: AppGaps.extraLarge,
        bottom: AppGaps.large,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              '${AppLocalizations.hello}, ${viewModel.userName ?? ''}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: AppGaps.small),
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.newCofrinhoMessage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderFeature extends StatelessWidget {
  const HeaderFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const iconSize = 32.0;
    var iconColor = Theme.of(context).colorScheme.primaryContainer;

    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            width: double.infinity,
            height: 256,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
        ),
        Positioned(
          bottom: 32,
          left: 24,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: iconSize,
                  ),
                  Icon(
                    Icons.school_outlined,
                    size: iconSize,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: iconSize,
                  ),
                  Icon(
                    Icons.school_outlined,
                    size: iconSize,
                    color: iconColor,
                  ),
                ],
              ),
              const SizedBox(
                width: AppGaps.extraLarge,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: iconSize,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: iconSize,
                  ),
                  Icon(
                    Icons.school_outlined,
                    size: iconSize,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: AppGaps.extraLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset(
            AppStringSvg.newCofrinhoIllustration,
            width: AppSizes.illustrationLarge,
          ),
        ),
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomShapeClipper oldClipper) => false;
}
