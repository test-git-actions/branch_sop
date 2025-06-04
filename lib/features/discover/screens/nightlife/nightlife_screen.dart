import 'package:branch_links/core/constants/tag_filters.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/discover/screens/nightlife/cubit/nightlife_cubit.dart';
import 'package:branch_links/features/link_details/screens/widgets/social_metadata_widget.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:branch_links/features/properties/screens/widgets/properties_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class NightlifeScreen extends StatelessWidget {
  const NightlifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
        BlocProvider(create: (_) => NightlifeCubit()),
        BlocProvider(create: (context) => AnalyticsKeysCubit()),
      ],
      child: const NightlifeWidget(),
    );
  }
}

class NightlifeWidget extends StatefulWidget {
  const NightlifeWidget({super.key});

  @override
  State<NightlifeWidget> createState() => _NightlifeWidgetState();
}

class _NightlifeWidgetState extends State<NightlifeWidget> {
  final adobeDeepLinkTextController = TextEditingController();

  @override
  void dispose() {
    adobeDeepLinkTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nightlifeCubit = context.read<NightlifeCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Nightlife'),
      body: BlocBuilder<NightlifeCubit, NightlifeState>(
        builder: (context, state) {
          return Card(
            margin: const EdgeInsets.all(VegaSpacings.space5x),
            child: Padding(
              padding: const EdgeInsets.all(VegaSpacings.space2x),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PropertiesOptionsWidget(
                      key: const Key('PropertiesOptionsWidget'),
                      onSelected: (properties) {
                        nightlifeCubit.setProperties(properties.toSet());
                      },
                    ),
                    const SizedBox(height: VegaSizing.size4x),
                    ConstrainedBox(
                      key: const Key('NightlifeCategoriesOptionsWidget'),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: MultiSelectDialogField<Filter>(
                        items: nightlifeCategoryFilters
                            .map(
                              (e) => MultiSelectItem(e, e.name),
                            )
                            .toList(),
                        onConfirm: (categories) {
                          nightlifeCubit.setNightlifeCategoriesFilters(
                            categories.toSet(),
                          );
                        },
                        searchable: true,
                        buttonText: const Text('Tags - Category (optional)'),
                        dialogHeight: MediaQuery.sizeOf(context).height * .5,
                        selectedColor: Theme.of(context).primaryColor,
                        chipDisplay: MultiSelectChipDisplay(
                          chipColor: Theme.of(context).primaryColor,
                          textStyle: VegaSemanticTypographies.labelRegularXs
                              .copyWith(color: VegaColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: VegaSizing.size4x),
                    const AnalyticsKeysWidget(),
                    const SizedBox(height: VegaSizing.size4x),
                    VegaButton(
                      variant: VegaButtonVariant.primary,
                      onPressed: () {
                        // Get Updated Analytics keys
                        final updatedAnalyticsKeys =
                            context.read<AnalyticsKeysCubit>().state;
                        final analyticsKeys =
                            updatedAnalyticsKeys.analyticsKeys;
                        final adobeDeepLinkParameter =
                            updatedAnalyticsKeys.adobeDeepLinkParameter;

                        // Generate link
                        nightlifeCubit.createLink(
                          analyticsKeys?.toMap(),
                          adobeDeepLinkParameter,
                        );
                      },
                      text: 'Generate',
                    ),
                    const SizedBox(height: VegaSizing.size5x),
                    if (state.isLoading) const CircularProgressIndicator(),
                    if (state.errorMessage != null)
                      Text(
                        'Something went wrong... ${state.errorMessage}',
                      ),
                    if (state.deepLinkURL != null) ...[
                      const Text('Generated Deep Link'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(state.deepLinkURL!),
                        ],
                      ),
                      if (state.metadata != null)
                        SocialMetadataWidget(
                          link: state.deepLinkURL!,
                          metadata: state.metadata!,
                        ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
