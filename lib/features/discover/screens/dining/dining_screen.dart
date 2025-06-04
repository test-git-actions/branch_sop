import 'package:branch_links/core/constants/tag_filters.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/discover/screens/dining/cubit/dining_cubit.dart';
import 'package:branch_links/features/link_details/screens/widgets/social_metadata_widget.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:branch_links/features/properties/screens/widgets/properties_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class DiningScreen extends StatelessWidget {
  const DiningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
        BlocProvider(create: (_) => DiningCubit()),
        BlocProvider(create: (context) => AnalyticsKeysCubit()),
      ],
      child: const DiningWidget(),
    );
  }
}

class DiningWidget extends StatefulWidget {
  const DiningWidget({super.key});

  @override
  State<DiningWidget> createState() => _DiningWidgetState();
}

class _DiningWidgetState extends State<DiningWidget> {
  final adobeDeepLinkTextController = TextEditingController();

  @override
  void dispose() {
    adobeDeepLinkTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diningCubit = context.read<DiningCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Dining'),
      body: BlocBuilder<DiningCubit, DiningState>(
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
                        diningCubit.setProperties(properties.toSet());
                      },
                    ),
                    const SizedBox(height: VegaSizing.size4x),
                    ConstrainedBox(
                      key: const Key('MealsOptionsWidget'),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: MultiSelectDialogField<Filter>(
                        items: mealTypeFilters
                            .map(
                              (e) => MultiSelectItem(e, e.name),
                            )
                            .toList(),
                        onConfirm: (meals) {
                          diningCubit.setMealTypeFilters(meals.toSet());
                        },
                        searchable: true,
                        buttonText: const Text('Tags - Meals (optional)'),
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
                    ConstrainedBox(
                      key: const Key('CuisinesOptionsWidget'),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: MultiSelectDialogField<Filter>(
                        items: cuisineFilters
                            .map(
                              (e) => MultiSelectItem(e, e.name),
                            )
                            .toList(),
                        onConfirm: (cuisines) {
                          diningCubit.setCuisineFilters(cuisines.toSet());
                        },
                        searchable: true,
                        buttonText: const Text('Tags - Cuisines (optional)'),
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
                    ConstrainedBox(
                      key: const Key('PricesOptionsWidget'),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: MultiSelectDialogField<Filter>(
                        items: priceFilters
                            .map(
                              (e) => MultiSelectItem(e, e.name),
                            )
                            .toList(),
                        onConfirm: (prices) {
                          diningCubit.setPriceFilters(prices.toSet());
                        },
                        searchable: true,
                        buttonText: const Text('Tags - Prices (optional)'),
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
                    ConstrainedBox(
                      key: const Key('DiningOptionsWidget'),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: MultiSelectDialogField<Filter>(
                        items: optionFilters
                            .map(
                              (e) => MultiSelectItem(e, e.name),
                            )
                            .toList(),
                        onConfirm: (options) {
                          diningCubit.setOptionsFilters(options.toSet());
                        },
                        searchable: true,
                        buttonText: const Text('Dining options'),
                        dialogHeight: MediaQuery.sizeOf(context).height * .5,
                        selectedColor: Theme.of(context).primaryColor,
                        chipDisplay: MultiSelectChipDisplay(
                          chipColor: Theme.of(context).primaryColor,
                          textStyle: VegaSemanticTypographies.labelRegularXs
                              .copyWith(color: VegaColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: VegaSizing.size2x),
                    const AnalyticsKeysWidget(),
                    const SizedBox(height: VegaSizing.size4x),
                    if (!state.isLoading)
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
                          diningCubit.createLink(
                            analyticsKeys?.toMap(),
                            adobeDeepLinkParameter,
                          );
                        },
                        text: 'Generate',
                      ),
                    const SizedBox(height: VegaSizing.size5x),
                    if (state.isLoading) const CircularProgressIndicator(),
                    if (state.errorMessage != null)
                      Text('Something went wrong... ${state.errorMessage}'),
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
