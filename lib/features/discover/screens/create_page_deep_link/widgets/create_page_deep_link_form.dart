import 'package:branch_links/core/presentation/widgets/generating_button.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/cubit/create_page_deep_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class CreatePageDeepLinkForm extends StatefulWidget {
  const CreatePageDeepLinkForm({super.key});

  @override
  State<CreatePageDeepLinkForm> createState() => _CreatePageDeepLinkFormState();
}

class _CreatePageDeepLinkFormState extends State<CreatePageDeepLinkForm> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final createPageDeepLinkCubit = context.read<CreatePageDeepLinkCubit>();
    return Card(
      margin: const EdgeInsets.all(VegaSpacings.space5x),
      child: Padding(
        padding: const EdgeInsets.all(VegaSpacings.space2x),
        child: SingleChildScrollView(
          controller: scrollController,
          child: BlocBuilder<CreatePageDeepLinkCubit, CreatePageDeepLinkState>(
            builder: (context, state) {
              final isLoading = state.isLoading;
              final generatedLink = state.generatedLink ?? '';
              final errorMessage = state.apiErrorMessage ?? '';
              final linkName = state.link.name;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Link parameters',
                    style: VegaSemanticTypographies.headingMedium1,
                  ),
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: VegaDefaultInput(
                      label: 'Name',
                      initialValue: linkName,
                      onChanged: createPageDeepLinkCubit.updateLinkName,
                    ),
                  ),
                  const SizedBox(
                    height: VegaSpacings.space4x,
                  ),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: const AnalyticsKeysWidget(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: VegaSizing.size2x),
                    child: GenerateButton(
                      onPressed: () {
                        // Get Updated Analytics keys
                        final updatedAnalyticsKeys =
                            context.read<AnalyticsKeysCubit>().state;
                        final analyticsKeys =
                            updatedAnalyticsKeys.analyticsKeys;
                        final adobeDeepLinkParameter =
                            updatedAnalyticsKeys.adobeDeepLinkParameter;

                        // Generate link
                        createPageDeepLinkCubit.generateNormalLink(
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
                  ),
                  if (errorMessage.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: VegaSizing.size1x,
                      ),
                      child: Text(
                        'Error: $errorMessage',
                        style: VegaSemanticTypographies.bodyMediumXs,
                      ),
                    ),
                  ],
                  if (generatedLink.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: VegaSizing.size1x,
                      ),
                      child: Row(
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
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
