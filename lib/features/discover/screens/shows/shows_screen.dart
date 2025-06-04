import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowsScreen extends StatelessWidget {
  const ShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StaticLinksCubit(databasePath: DatabasePath.shows)..getLinks(),
      child: const ShowsWidget(),
    );
  }
}

class ShowsWidget extends StatelessWidget {
  const ShowsWidget({
    this.productType = ProductType.show,
    super.key,
  });

  final ProductType productType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shows',
      ),
      body: BlocBuilder<StaticLinksCubit, StaticLinksState>(
        builder: (context, state) {
          return switch (state) {
            StaticLinkLoading() =>
              const Center(child: CircularProgressIndicator()),
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
                // onAdd
              ),
            StaticLinkError() =>
              const Center(child: Text('Something went wrong...')),
          };
        },
      ),
    );
  }
}
