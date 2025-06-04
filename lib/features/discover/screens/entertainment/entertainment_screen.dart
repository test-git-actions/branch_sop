import 'package:branch_links/core/constants/tag_filters.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/discover/screens/entertainment/cubit/entertainment_cubit.dart';
import 'package:branch_links/features/discover/screens/entertainment/widgets/date_selection_widget.dart';
import 'package:branch_links/features/link_details/screens/widgets/social_metadata_widget.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:branch_links/features/properties/screens/widgets/properties_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
        BlocProvider(create: (_) => EntertainmentCubit()),
        BlocProvider(create: (context) => AnalyticsKeysCubit()),
      ],
      child: const EntertainmentWidget(),
    );
  }
}

class EntertainmentWidget extends StatefulWidget {
  const EntertainmentWidget({super.key});

  @override
  State<EntertainmentWidget> createState() => _EntertainmentWidgetState();
}

class _EntertainmentWidgetState extends State<EntertainmentWidget> {
  final adobeDeepLinkTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    adobeDeepLinkTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entertainmentCubit = context.read<EntertainmentCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Entertainment'),
      body: BlocBuilder<EntertainmentCubit, EntertainmentState>(
        builder: (context, state) {
          return Card(
            margin: const EdgeInsets.all(VegaSpacings.space5x),
            child: Padding(
              padding: const EdgeInsets.all(VegaSpacings.space2x),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateSelectionWidget(
                        key: const Key('StartDateWidget'),
                        title: 'Start date (optional)',
                        initialDate: entertainmentCubit.state.startDate,
                        onSelectedDate: (DateTime? date) {
                          entertainmentCubit.setStartDate(date);
                        },
                        validator: (_) {
                          if (entertainmentCubit.state.startDate == null ||
                              entertainmentCubit.state.endDate == null) {
                            return null;
                          }

                          if (entertainmentCubit.state.startDate!.isBefore(
                            entertainmentCubit.state.endDate!,
                          )) {
                            return null;
                          }

                          return "Start date should be before End Date.";
                        },
                      ),
                      const SizedBox(height: VegaSizing.size2x),
                      DateSelectionWidget(
                        key: const Key('EndDateWidget'),
                        title: 'End date (optional)',
                        initialDate: entertainmentCubit.state.endDate,
                        onSelectedDate: (DateTime? date) {
                          entertainmentCubit.setEndDate(date);
                        },
                        validator: (value) {
                          if (entertainmentCubit.state.startDate == null ||
                              entertainmentCubit.state.endDate == null) {
                            return null;
                          }

                          if (entertainmentCubit.state.endDate!.isAfter(
                            entertainmentCubit.state.startDate!,
                          )) {
                            return null;
                          }

                          return "End date should be after Start date.";
                        },
                      ),
                      const SizedBox(height: VegaSizing.size4x),
                      PropertiesOptionsWidget(
                        key: const Key('PropertiesOptionsWidget'),
                        onSelected: (properties) {
                          entertainmentCubit.setProperties(properties.toSet());
                        },
                      ),
                      const SizedBox(height: VegaSizing.size4x),
                      ConstrainedBox(
                        key: const Key('CategoriesOptionsWidget'),
                        constraints: const BoxConstraints(
                          maxWidth: 400,
                        ),
                        child: MultiSelectDialogField<Filter>(
                          items: entertainmentCategoriesFilters
                              .map(
                                (e) => MultiSelectItem(e, e.name),
                              )
                              .toList(),
                          onConfirm: (categories) {
                            entertainmentCubit
                                .setCategoriesFilters(categories.toSet());
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
                      if (!state.isLoading)
                        VegaButton(
                          variant: VegaButtonVariant.primary,
                          text: 'Generate',
                          onPressed: () {
                            if (!(formKey.currentState?.validate() ?? false)) {
                              return;
                            }

                            List<Property> properties = [];

                            context.read<PropertiesCubit>().state.whenOrNull(
                              loaded: ((selectedProperties) {
                                properties = selectedProperties;
                              }),
                            );

                            // Get Updated Analytics keys
                            final updatedAnalyticsKeys =
                                context.read<AnalyticsKeysCubit>().state;
                            final analyticsKeys =
                                updatedAnalyticsKeys.analyticsKeys;
                            final adobeDeepLinkParameter =
                                updatedAnalyticsKeys.adobeDeepLinkParameter;

                            entertainmentCubit.createLink(
                              properties: properties,
                              updateAnalyticsKeys: analyticsKeys?.toMap(),
                              updatedAdobeDeepLinkParameter:
                                  adobeDeepLinkParameter,
                            );
                          },
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
            ),
          );
        },
      ),
    );
  }
}
