import 'package:vega_components/vega_components.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOfferButtonWidget extends StatelessWidget {
  final Function() onUpdate;
  final String text;

  const UpdateOfferButtonWidget({
    super.key,
    required this.onUpdate,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
      builder: (context, state) {
        if (state is UpdateOfferData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.isUpdating)
                const Center(child: CircularProgressIndicator())
              else
                VegaButton(
                  variant: VegaButtonVariant.primary,
                  onPressed: onUpdate,
                  text: text,
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
