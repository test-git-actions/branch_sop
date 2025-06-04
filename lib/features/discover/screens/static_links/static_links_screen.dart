import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaticLinksScreen extends StatelessWidget {
  const StaticLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StaticLinksCubit(databasePath: DatabasePath.discover)..getLinks(),
      child: const StaticLinksWidget(),
    );
  }
}

class StaticLinksWidget extends StatelessWidget {
  const StaticLinksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Static links',
      ),
      body: BlocBuilder<StaticLinksCubit, StaticLinksState>(
        builder: (context, state) {
          return switch (state) {
            StaticLinkLoading() =>
              const Center(child: CircularProgressIndicator()),
            StaticLinkDataLoaded(:final filteredLinks) => LinksList(
                links: filteredLinks,
                listName: 'Discover links',
              ),
            StaticLinkError() =>
              const Center(child: Text('Something went wrong...')),
          };
        },
      ),
    );
  }
}
