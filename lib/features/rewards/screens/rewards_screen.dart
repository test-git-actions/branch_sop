import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StaticLinksCubit(databasePath: DatabasePath.rewards)..getLinks(),
      child: const RewardsWidget(),
    );
  }
}

class RewardsWidget extends StatelessWidget {
  const RewardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Rewards links'),
      body: BlocBuilder<StaticLinksCubit, StaticLinksState>(
        builder: (context, state) {
          return switch (state) {
            StaticLinkLoading() =>
              const Center(child: CircularProgressIndicator()),
            StaticLinkDataLoaded(:final filteredLinks) => LinksList(
                listName: 'reward links',
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
