import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:branch_links/core/mixins/url_validator_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentTypeSelectorWidget extends StatefulWidget with URLValidatorMixin {
  final TextEditingController ctaURLController;
  final TextEditingController pathController;

  const ContentTypeSelectorWidget({
    super.key,
    required this.ctaURLController,
    required this.pathController,
  });

  @override
  State<ContentTypeSelectorWidget> createState() =>
      _ContentTypeSelectorWidgetState();
}

class _ContentTypeSelectorWidgetState extends State<ContentTypeSelectorWidget> {
  var isCtaEmpty = false;
  var isPathEmpty = false;

  @override
  Widget build(BuildContext context) {
    final updateOfferCubit = context.read<UpdateOfferCubit>();
    return BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
      builder: (context, state) {
        ContentType? contentType;
        if (state is UpdateOfferData) {
          contentType = state.updatedOffer.contentType;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<ContentType>(
              value: contentType,
              isExpanded: true,
              dropdownColor: Colors.white,
              items: ContentType.values
                  .map(
                    (c) => DropdownMenuItem<ContentType>(
                      value: c,
                      child: Text(c.name),
                    ),
                  )
                  .toList(),
              onChanged: updateOfferCubit.changeContentType,
            ),
            if (contentType != null &&
                contentType != ContentType.roomSegment) ...[
              const SizedBox(height: VegaSizing.size3x),
              if (contentType == ContentType.custom)
                VegaDefaultInput(
                  key: const Key('CtaURLTextFormField'),
                  controller: widget.ctaURLController,
                  label: 'CTA URL',
                  error: isCtaEmpty ? 'This field should not be empty' : '',
                  onChanged: (text) {
                    setState(() {
                      isCtaEmpty = text.isEmpty;
                    });

                    updateOfferCubit.updateCtaURL(text);
                  },
                )
              else
                VegaDefaultInput(
                  key: const Key('PathTextFormField'),
                  controller: widget.pathController,
                  label: 'Path',
                  error: isPathEmpty ? 'This field should not be empty' : '',
                  onChanged: (text) {
                    setState(() {
                      isPathEmpty = text.isEmpty;
                    });
                    updateOfferCubit.updatePath(text);
                  },
                ),
            ],
          ],
        );
      },
    );
  }
}
