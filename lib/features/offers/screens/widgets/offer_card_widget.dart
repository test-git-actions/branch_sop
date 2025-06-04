import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VegaSizing.size4x),
      child: BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
        builder: (context, state) {
          return switch (state) {
            UpdateOfferLoading() =>
              const Center(child: CircularProgressIndicator()),
            UpdateOfferData(:final updatedOffer) =>
              OfferCardContentWidget(offer: updatedOffer),
            UpdateOfferError() => const Center(child: Text('Error')),
          };
        },
      ),
    );
  }
}

class OfferCardContentWidget extends StatelessWidget {
  final Offer offer;
  const OfferCardContentWidget({
    required this.offer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${offer.imageURL}.image.800.600.high.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(offer, context),
            child: Container(
              padding: const EdgeInsets.all(
                VegaSemanticSpacings.spaceComponentM,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    VegaColors.gray800.withAlpha(0),
                    VegaColors.gray900.withAlpha(191),
                    VegaColors.black,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    offer.name,
                    textAlign: TextAlign.center,
                    style: VegaSemanticTypographies.bodyMediumL
                        .copyWith(color: VegaColors.brand25),
                  ),
                  Text(
                    offer.description,
                    textAlign: TextAlign.center,
                    style: VegaSemanticTypographies.bodyRegularM
                        .copyWith(color: VegaColors.brand25),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(
                      VegaSemanticSpacings.spaceComponentM,
                    ),
                  ),
                  VegaButton(
                    text: offer.customCTA,
                    variant: VegaButtonVariant.secondary,
                    isInverted: true,
                    size: VegaButtonSize.small,
                    onPressed: () => onTap(
                      offer,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTap(Offer updatedOffer, BuildContext context) {
    String? message;
    switch (updatedOffer.contentType) {
      case ContentType.custom:
        launchUrl(Uri.parse(updatedOffer.customCTA));
      case ContentType.show || ContentType.clubBar || ContentType.restaurant:
        message = 'Navigate to ${updatedOffer.path}';
      case ContentType.roomSegment:
        message = 'Navigate to room booking';
    }
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
