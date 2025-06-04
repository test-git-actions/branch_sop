import 'package:branch_links/core/presentation/widgets/generating_button.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/checkin/cubit/create_checkin_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class CreateCheckinLinkForm extends StatelessWidget {
  const CreateCheckinLinkForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      margin: const EdgeInsets.all(VegaSpacings.space5x),
      child: Padding(
        padding: const EdgeInsets.all(VegaSpacings.space2x),
        child: BlocBuilder<CreateCheckinLinkCubit, CreateCheckinLinkState>(
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Link parameters',
                    style: VegaSemanticTypographies.headingMedium1,
                  ),
                ),
                Wrap(
                  spacing: VegaSpacings.space5x,
                  runSpacing: VegaSpacings.space2x,
                  alignment: WrapAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: VegaDefaultInput(
                        label: 'Last name',
                        onChanged: context
                            .read<CreateCheckinLinkCubit>()
                            .updateLastName,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: VegaDefaultInput(
                        label: 'Reservation number',
                        onChanged: context
                            .read<CreateCheckinLinkCubit>()
                            .updateReservationNumber,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: VegaSpacings.space4x,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: const AnalyticsKeysWidget(),
                ),

                const SizedBox(height: VegaSpacings.space3x),
                GenerateButton(
                  onPressed: () {
                    // Get Updated Analytics keys
                    final updatedAnalyticsKeys =
                        context.read<AnalyticsKeysCubit>().state;
                    final analyticsKeys = updatedAnalyticsKeys.analyticsKeys;
                    final adobeDeepLinkParameter =
                        updatedAnalyticsKeys.adobeDeepLinkParameter;

                    context.read<CreateCheckinLinkCubit>().generateDeepLink(
                          analyticsKeys?.toMap(),
                          adobeDeepLinkParameter,
                        );
                  },
                  isLoading: state.isLoading,
                ),

                // // Show Url Link to be shown when the deep link is generated
                if (state.generatedDeepLink != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: VegaSizing.size1x),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SelectableText(
                            state.generatedDeepLink!,
                            style: VegaSemanticTypographies.bodyMediumS
                                .copyWith(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (state.apiErrorMessage != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.apiErrorMessage!),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
