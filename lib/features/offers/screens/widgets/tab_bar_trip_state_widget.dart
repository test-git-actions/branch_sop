import 'package:branch_links/core/presentation/widgets/alerts.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_tokens/vega_tokens.dart';

class TabBarStripStateWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const TabBarStripStateWidget({super.key});

  @override
  State<TabBarStripStateWidget> createState() => _TabBarStripStateWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _TabBarStripStateWidgetState extends State<TabBarStripStateWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: TripState.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appTheme().primaryColor,
      child: BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
        builder: (context, state) {
          final tabs = [
            Tab(
              child: Text(
                TripState.inTrip.title.toUpperCase(),
                style: VegaSemanticTypographies.bodyRegularS
                    .copyWith(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                TripState.preTripOver72Hours.title.toUpperCase(),
                style: VegaSemanticTypographies.bodyRegularS
                    .copyWith(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                TripState.preTripUnder72Hours.title.toUpperCase(),
                style: VegaSemanticTypographies.bodyRegularS
                    .copyWith(color: Colors.white),
              ),
            ),
          ];
          if (state is UpdateOfferData) {
            if (state.isSelectTripState) {
              return TabBar(
                controller: _tabController,
                indicatorWeight: 5,
                indicatorColor: Colors.yellow,
                tabs: tabs,
                onTap: (index) {
                  TripState passedstate = TripState.values[index];
                  _onTap(
                    state.tripState,
                    passedstate,
                    state.isOfferEdited,
                  );
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  _onTap(
    TripState? currentTripState,
    TripState nextTripState,
    bool isOfferEdited,
  ) async {
    if (currentTripState == nextTripState) {
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
      context.read<UpdateOfferCubit>().setTripState(nextTripState, []);
      _tabController.index = nextTripState.index;
    }
  }
}
