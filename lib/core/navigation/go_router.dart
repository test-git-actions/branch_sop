import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/features/auth/core/data/auth_repository.dart';
import 'package:branch_links/features/auth/cubit/sign_in_cubit.dart';
import 'package:branch_links/features/auth/sign_in_screen.dart';
import 'package:branch_links/features/challenge/screens/challenge_screen.dart';
import 'package:branch_links/features/checkin/screens/create_checkin_link_screen.dart';
import 'package:branch_links/features/discover/screens/clubs/clubs_screen.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/create_deep_link_screen.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/create_page_deep_link_screen.dart';
import 'package:branch_links/features/discover/screens/dining/dining_screen.dart';
import 'package:branch_links/features/discover/screens/discover_screen.dart';
import 'package:branch_links/features/discover/screens/entertainment/entertainment_screen.dart';
import 'package:branch_links/features/discover/screens/nightlife/nightlife_screen.dart';
import 'package:branch_links/features/discover/screens/restaurants/restaurants_screen.dart';
import 'package:branch_links/features/discover/screens/shows/shows_screen.dart';
import 'package:branch_links/features/discover/screens/static_links/static_links_screen.dart';
import 'package:branch_links/features/home/screens/home_screen.dart';
import 'package:branch_links/features/link_details/screens/link_details_screen.dart';
import 'package:branch_links/features/me/screens/me_screen.dart';
import 'package:branch_links/features/offers/screens/update_offer_screen.dart';
import 'package:branch_links/features/other/screens/other_screen.dart';
import 'package:branch_links/features/rewards/screens/rewards_screen.dart';
import 'package:branch_links/features/trips/screens/trips_screen.dart';
import 'package:branch_links/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

bool get isAuth => FirebaseAuth.instance.currentUser != null;

class Routes {
  static const main = '/';
  static const signIn = '/sign-in';

  static const createDeepLink = '/create-checkin-link';
  // Discover links
  static const discover = '/discover';
  static const discoverStatic = '/discover/static';
  //  Discover sections
  static const dining = '/discover/dining';
  static const entertainment = '/discover/entertainment';
  static const nightlife = '/discover/nightlife';
  //  Discover PDPs
  static const restaurants = '/discover/restaurants';
  static const shows = '/discover/shows';
  static const clubs = '/discover/clubs';

  static const rewards = '/rewards';
  static const challenge = '/challenge';
  static const home = '/home';
  static const trips = '/trips';
  static const me = '/me';
  static const other = '/other';

  static const generatedLinkDetails = '/link_details';

  static const createPdpDeepLink = '/discover/create-pdp-deep-link';
  static const createPageDeepLink = '/discover/create-page-deep-link';
  static const updateOffer = '/update-offer';

  static final GoRouter _router = _createRouter();
  static GoRouter get goRouter => _router;
}

GoRouter _createRouter() => GoRouter(
      initialLocation: Routes.main,
      debugLogDiagnostics: kDebugMode,
      refreshListenable: UserRefreshStream(),
      redirect: (BuildContext context, GoRouterState state) {
        if (isAuth && state.fullPath?.contains(Routes.signIn) == true) {
          return Routes.home;
        }
        return isAuth ? null : Routes.signIn;
      },
      routes: [
        GoRoute(
          path: Routes.signIn,
          builder: (context, state) => BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignInScreen(),
          ),
        ),
        GoRoute(
          path: Routes.main,
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: Routes.discover.lastPath,
              builder: (context, state) => const DiscoverScreen(),
              routes: [
                GoRoute(
                  path: Routes.discoverStatic.lastPath,
                  builder: (context, state) => const StaticLinksScreen(),
                ),
                GoRoute(
                  path: Routes.restaurants.lastPath,
                  builder: (context, state) => const RestaurantsScreen(),
                ),
                GoRoute(
                  path: Routes.clubs.lastPath,
                  builder: (context, state) => const ClubsScreen(),
                ),
                GoRoute(
                  path: Routes.shows.lastPath,
                  builder: (context, state) => const ShowsScreen(),
                ),
                GoRoute(
                  path: Routes.dining.lastPath,
                  builder: (context, state) => const DiningScreen(),
                ),
                GoRoute(
                  path: Routes.entertainment.lastPath,
                  builder: (context, state) => const EntertainmentScreen(),
                ),
                GoRoute(
                  path: Routes.nightlife.lastPath,
                  builder: (context, state) => const NightlifeScreen(),
                ),
                GoRoute(
                  name: Routes.createPdpDeepLink,
                  path: '${Routes.createPdpDeepLink.lastPath}/:productType',
                  redirect: (context, state) {
                    final link = state.extra as Link?;

                    if (link == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid link'),
                        ),
                      );
                      return Routes.main;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    // productType cannot be null as it is a path parameter
                    final productType = ProductType.fromString(
                      state.pathParameters['productType']!,
                    );

                    if (productType == null) {
                      //TODO TICKET create error page
                      return const Text("Sorry, an error occured");
                    }

                    // productType cannot be null as it is checked in redirect
                    final link = state.extra as Link?;
                    return CreatePdpDeepLinkScreen(
                      productType: productType,
                      link: link!,
                    );
                  },
                ),
                GoRoute(
                  name: Routes.createPageDeepLink,
                  path: Routes.createPageDeepLink.lastPath,
                  redirect: (context, state) {
                    final link = state.extra as Link?;
                    if (link == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid link'),
                        ),
                      );
                      return Routes.main;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    final link = state.extra as Link?;
                    return CreatePageDeepLinkScreen(
                      link: link!,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.challenge.lastPath,
              builder: (context, state) => const ChallengeLinkScreen(),
            ),
            GoRoute(
              path: Routes.rewards.lastPath,
              builder: (context, state) => const RewardsScreen(),
            ),
            GoRoute(
              path: Routes.createDeepLink.lastPath,
              builder: (context, state) => const CreateCheckinLinkScreen(),
            ),
            GoRoute(
              path: Routes.home.lastPath,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: Routes.trips.lastPath,
              builder: (context, state) => const TripsScreen(),
            ),
            GoRoute(
              path: Routes.me.lastPath,
              builder: (context, state) => const MeScreen(),
            ),
            GoRoute(
              path: Routes.other.lastPath,
              builder: (context, state) => const OtherScreen(),
            ),
            GoRoute(
              path: Routes.generatedLinkDetails.lastPath,
              builder: (context, state) => const LinkDetailsScreen(),
            ),
            GoRoute(
              path: Routes.updateOffer.lastPath,
              builder: (context, state) => const UpdateOfferScreen(),
            ),
          ],
        ),
      ],
    );

extension on String {
  String get lastPath => split('/').last;
}
