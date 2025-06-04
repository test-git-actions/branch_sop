import 'package:branch_links/core/presentation/widgets/alerts.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_tokens/vega_tokens.dart';

class TripStateOffersListWidget extends StatelessWidget {
  const TripStateOffersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
      builder: (context, state) {
        if (state is UpdateOfferData) {
          if (state.isSelectTripState) {
            if (state.offersList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: VegaSizing.size2x,
                  left: VegaSizing.size3x,
                  right: VegaSizing.size3x,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.offersList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () async {
                                  bool? confirm = true;
                                  if (state.isOfferEdited) {
                                    confirm = await Alerts.showDecisionAlert(
                                      context,
                                      'Are you sure to change offer type?',
                                      description:
                                          'Switching the offer type you will lose the current changes. Save it before switching!',
                                    );
                                  }
                                  if (confirm ?? false) {
                                    // ignore: use_build_context_synchronously
                                    context
                                        .read<UpdateOfferCubit>()
                                        .setOfferFromListToEdit(index);
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: state.indexIsChanging == index
                                          ? Colors.yellow
                                          : Colors.white,
                                      width: state.indexIsChanging == index
                                          ? 3
                                          : 0,
                                      style: BorderStyle.solid,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                    ),
                                    shape: BoxShape.circle,
                                    color: appTheme().primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        index.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () async {
                          bool? confirm = true;

                          if (state.isOfferEdited) {
                            confirm = await Alerts.showDecisionAlert(
                              context,
                              'Are you sure to change offer type?',
                              description:
                                  'Switching the offer type you will lose the current changes. Save it before switching!',
                            );
                          }
                          if (confirm ?? false) {
                            // ignore: use_build_context_synchronously
                            context
                                .read<UpdateOfferCubit>()
                                .addNewOfferToTripState();
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme().primaryColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: VegaSizing.size2x,
                    left: VegaSizing.size3x,
                    right: VegaSizing.size3x,
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () async {
                      bool? confirm = true;

                      if (state.isOfferEdited) {
                        confirm = await Alerts.showDecisionAlert(
                          context,
                          'Are you sure to change offer type?',
                          description:
                              'Switching the offer type you will lose the current changes. Save it before switching!',
                        );
                      }
                      if (confirm ?? false) {
                        // ignore: use_build_context_synchronously
                        context
                            .read<UpdateOfferCubit>()
                            .addNewOfferToTripState();
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appTheme().primaryColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
