import 'package:cofrinho_app/app/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/strings/app_string_svg.dart';
import '../../../../shared/themes/app_gaps.dart';
import '../../../../shared/themes/app_sizes.dart';
import '../../../../shared/widgets/custom_filled_button.dart';
import '../viewmodel/new_cofrinho_viewmodel.dart';

class NewPiggyBankView extends ConsumerStatefulWidget {
  const NewPiggyBankView({super.key});

  @override
  NewPiggyBankViewState createState() => NewPiggyBankViewState();
}

class NewPiggyBankViewState extends ConsumerState<NewPiggyBankView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(NewPiggyBankViewModelProvider).getUserName());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(NewPiggyBankViewModelProvider);

    return Scaffold(
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
                              Symbols.check,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          title: Text(
                            viewModel.listTitles[index],
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                          ),
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
                onPressed: () {
                  context.push(AppRoutes.objective);
                },
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

  final NewPiggyBankViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppGaps.large,
        top: AppGaps.large,
        right: AppGaps.large,
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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
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
          left: 16,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: AppGaps.extraLarge,
                  ),
                  Icon(
                    Symbols.travel_luggage_and_bags_rounded,
                    size: iconSize,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: iconSize,
                  ),
                  Icon(
                    Symbols.tools_power_drill_rounded,
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
                    Symbols.featured_seasonal_and_gifts_rounded,
                    size: iconSize,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: iconSize,
                  ),
                  Icon(
                    Symbols.school_rounded,
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
            top: 8,
            left: 12,
            child: IconButton.filledTonal(
              onPressed: () {
                context.pop(context);
              },
              icon: Icon(Symbols.close_rounded,
                  color: Theme.of(context).colorScheme.onSurface),
            )),
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
