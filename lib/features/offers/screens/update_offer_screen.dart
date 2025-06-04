import 'package:branch_links/core/presentation/widgets/text_environment.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/widgets/offer_card_widget.dart';
import 'package:branch_links/features/offers/screens/widgets/offer_form_widget.dart';
import 'package:branch_links/features/offers/screens/widgets/offers_tab_bar_widget.dart';
import 'package:branch_links/features/offers/screens/widgets/tab_bar_trip_state_widget.dart';
import 'package:branch_links/features/offers/screens/widgets/trip_state_offers_list_widget.dart';
import 'package:branch_links/main/widgets/env_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOfferScreen extends StatelessWidget {
  const UpdateOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateOfferCubit()..loadOffers(),
      child: const UpdateOfferWidget(),
    );
  }
}

class UpdateOfferWidget extends StatelessWidget {
  const UpdateOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Offer'),
        bottom: const OffersTabBarWidget(),
        actions: [
          if (Env().isDevApp)
            EnvDropDownMenu(
              onChanged: (_) {
                context.read<UpdateOfferCubit>().loadOffers();
              },
            )
          else
            const TextEnvironment(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBarStripStateWidget(),
            TripStateOffersListWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child: OfferFormWidget()),
                Flexible(child: OfferCardWidget()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
