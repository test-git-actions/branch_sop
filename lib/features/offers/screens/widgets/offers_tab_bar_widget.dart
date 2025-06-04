import 'package:branch_links/core/presentation/widgets/alerts.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_tokens/vega_tokens.dart';

class OffersTabBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const OffersTabBarWidget({super.key});

  @override
  State<OffersTabBarWidget> createState() => _OffersTabBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _OffersTabBarWidgetState extends State<OffersTabBarWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: AuthenticationState.values.length + 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOfferCubit, UpdateOfferState>(
      listener: _onListen,
      builder: (context, state) {
        return state.maybeMap(
          data: (dataState) {
            final tabs = AuthenticationState.values
                .map(
                  (e) => Tab(
                    child: Text(
                      e.title.toUpperCase(),
                      style: VegaSemanticTypographies.bodyRegularS
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
                .toList();
            tabs.add(
              Tab(
                child: Text(
                  "Trip State".toUpperCase(),
                  style: VegaSemanticTypographies.bodyRegularS
                      .copyWith(color: Colors.white),
                ),
              ),
            );
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 5,
                  child: TabBar(
                    controller: _tabController,
                    indicatorWeight: 5,
                    indicatorColor: Colors.yellow,
                    tabs: tabs,
                    onTap: (index) {
                      if (index != 3) {
                        _onTap(
                          dataState.selectedAuthState,
                          AuthenticationState.values[index],
                          dataState.originalOffers,
                          dataState.isOfferEdited,
                          dataState.isSelectTripState,
                        );
                      } else {
                        _onTapTripState(
                          index,
                          dataState.isOfferEdited,
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  _onListen(BuildContext context, UpdateOfferState state) {
    if (state is UpdateOfferLoading) {
      _tabController.index = 0;
    }
  }

  _onTap(
    AuthenticationState currentAuthState,
    AuthenticationState nextAuthState,
    Offers offers,
    bool isOfferEdited,
    bool tripStateActive,
  ) async {
    if (currentAuthState == nextAuthState && !tripStateActive) {
      return;
    }
    _tabController.index = _tabController.previousIndex;
    bool? confirm = true;
    if (isOfferEdited) {
      confirm = await Alerts.showDecisionAlert(
        context,
        'Are you sure to change offer type?',
        description:
            'Switching the offer type you will lose the current changes. Save it before switching!',
      );
    }

    if (mounted && (confirm ?? false)) {
      context.read<UpdateOfferCubit>().setOriginalOffer(nextAuthState);
      _tabController.index = nextAuthState.index;
    }
  }

  _onTapTripState(
    int index,
    bool isOfferEdited,
  ) async {
    _tabController.index = _tabController.previousIndex;
    bool? confirm = true;
    if (isOfferEdited) {
      confirm = await Alerts.showDecisionAlert(
        context,
        'Are you sure to change offer type?',
        description:
            'Switching the offer type you will lose the current changes. Save it before switching!',
      );
    }
    if (mounted && (confirm ?? false)) {
      context.read<UpdateOfferCubit>().setTripState(TripState.values.first, []);
      _tabController.index = index;
    }
  }
}
