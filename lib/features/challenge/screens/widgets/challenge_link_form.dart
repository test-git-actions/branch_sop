import 'package:branch_links/core/presentation/widgets/generating_button.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:branch_links/features/challenge/cubit/challenge_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class ChallengeLinkForm extends StatelessWidget {
  const ChallengeLinkForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      margin: const EdgeInsets.all(VegaSpacings.space5x),
      child: Padding(
        padding: const EdgeInsets.all(VegaSpacings.space2x),
        child: BlocBuilder<ChallengeLinkCubit, ChallengeLinkState>(
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
                        label: 'Challenge Id',
                        onChanged: context
                            .read<ChallengeLinkCubit>()
                            .updateChallengeId,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: VegaDefaultInput(
                        label: 'Member Id',
                        onChanged:
                            context.read<ChallengeLinkCubit>().updateMemberId,
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

                    context.read<ChallengeLinkCubit>().generateDeepLink(
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
