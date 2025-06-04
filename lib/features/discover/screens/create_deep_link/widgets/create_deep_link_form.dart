import 'package:branch_links/core/extensions/string_extensions.dart';
import 'package:branch_links/core/presentation/widgets/generating_button.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/cubit/create_deep_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_tokens/vega_tokens.dart';

class CreatePdpDeepLinkForm extends StatefulWidget {
  const CreatePdpDeepLinkForm({
    super.key,
  });

  @override
  State<CreatePdpDeepLinkForm> createState() => _CreatePdpDeepLinkFormState();
}

class _CreatePdpDeepLinkFormState extends State<CreatePdpDeepLinkForm> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return BlocBuilder<CreatePdpLinkCubit, CreateDeepLinkState>(
      builder: (context, state) {
        final productType = state.productType;
        final isLoading = state.isLoading;
        final generatedLink = state.generatedLink ?? '';
        final errorMessage = state.apiErrorMessage ?? '';
        final linkName = state.link.name;

        return Card(
          margin: const EdgeInsets.all(VegaSpacings.space5x),
          child: Padding(
            padding: const EdgeInsets.all(VegaSpacings.space2x),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${productType.value.capitalize()} link parameters',
                      style: VegaSemanticTypographies.headingMedium1,
                    ),
                  ),
                  const SizedBox(height: VegaSpacings.space4x),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Type',
                        style: VegaSemanticTypographies.bodyMediumM,
                      ),
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text(productType.value.capitalize()),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name',
                        style: VegaSemanticTypographies.bodyMediumM,
                      ),
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text(linkName),
                      ),
                    ],
                  ),
                  const SizedBox(height: VegaSpacings.space4x),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: const AnalyticsKeysWidget(),
                  ),
                  const SizedBox(height: VegaSpacings.space4x),
                  GenerateButton(
                    onPressed: () {
                      // Get Updated Analytics keys
                      final updatedAnalyticsKeys =
                          context.read<AnalyticsKeysCubit>().state;
                      final analyticsKeys = updatedAnalyticsKeys.analyticsKeys;
                      final adobeDeepLinkParameter =
                          updatedAnalyticsKeys.adobeDeepLinkParameter;

                      // Generate link
                      context.read<CreatePdpLinkCubit>().generateDeepLink(
                            analyticsKeys?.toMap(),
                            adobeDeepLinkParameter,
                          );

                      // Scroll to bottom
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.ease,
                      );
                    },
                    isLoading: isLoading,
                  ),
                  const Divider(),
                  if (errorMessage.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Text(
                            'Error: $errorMessage',
                            style: VegaSemanticTypographies.bodyMediumXs,
                          ),
                        ),
                      ],
                    ),
                  (generatedLink.isNotEmpty)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SelectableText(
                                key: const Key('GeneratedLink'),
                                generatedLink,
                                style: VegaSemanticTypographies.bodyMediumS
                                    .copyWith(overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
