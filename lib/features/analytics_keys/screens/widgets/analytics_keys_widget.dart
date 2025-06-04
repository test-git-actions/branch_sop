import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class AnalyticsKeysWidget extends StatelessWidget {
  const AnalyticsKeysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldWidth = MediaQuery.of(context).size.width * 0.4;
    final analyticsKeysCubit = context.read<AnalyticsKeysCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Analytics parameters',
          style: VegaSemanticTypographies.headingMedium1,
        ),
        const SizedBox(height: VegaSpacings.space2x),
        Wrap(
          spacing: VegaSpacings.space5x,
          runSpacing: VegaSpacings.space2x,
          alignment: WrapAlignment.start,
          children: [
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.platformOriginLabel,
                onChanged: analyticsKeysCubit.updatePlatformOrigin,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.campaignLabel,
                onChanged: analyticsKeysCubit.updateCampaign,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.utmMediumLabel,
                onChanged: analyticsKeysCubit.updateUtmMedium,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.creativeNameLabel,
                onChanged: analyticsKeysCubit.updateCreativeName,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.keywordLabel,
                onChanged: analyticsKeysCubit.updateKeyword,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label: Constants.siteLabel,
                onChanged: analyticsKeysCubit.updateSite,
              ),
            ),
            SizedBox(
              width: fieldWidth,
              child: VegaDefaultInput(
                label:
                    '${Constants.adobeDeepLinkLabel} ("${Constants.adobeDeepLinkParameter}")',
                onChanged: analyticsKeysCubit.updateAdobeDeepLinkParameter,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
