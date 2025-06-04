import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StaticLinksCubit(databasePath: DatabasePath.home)..getLinks(),
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home links',
      ),
      body: BlocBuilder<StaticLinksCubit, StaticLinksState>(
        builder: (context, state) {
          return switch (state) {
            StaticLinkLoading() =>
              const Center(child: CircularProgressIndicator()),
            StaticLinkDataLoaded(:final filteredLinks) => LinksList(
                listName: 'home links',
                links: filteredLinks,
                onTileAddPressed: (link) {
                  context.pushNamed(
                    Routes.createPageDeepLink,
                    extra: link,
                  );
                },
              ),
            StaticLinkError() =>
              const Center(child: Text('Something went wrong...')),
          };
        },
      ),
    );
  }
}
