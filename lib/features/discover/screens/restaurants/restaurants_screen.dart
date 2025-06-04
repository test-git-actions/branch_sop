import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StaticLinksCubit(databasePath: DatabasePath.restaurants)..getLinks(),
      child: const RestaurantsWidget(),
    );
  }
}

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({
    this.productType = ProductType.restaurant,
    super.key,
  });

  final ProductType productType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Restaurants'),
      body: BlocBuilder<StaticLinksCubit, StaticLinksState>(
        builder: (context, state) {
          return switch (state) {
            StaticLinkLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            StaticLinkDataLoaded(:final filteredLinks) => LinksList(
                listName: productType.value,
                links: filteredLinks,
                onTileAddPressed: (link) {
                  context.pushNamed(
                    Routes.createPdpDeepLink,
                    pathParameters: {'productType': productType.value},
                    extra: link,
                  );
                },
              ),
            StaticLinkError() => const Center(
                child: Text('Something went wrong...'),
              ),
          };
        },
      ),
    );
  }
}
