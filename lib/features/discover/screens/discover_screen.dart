import 'package:branch_links/core/constants/assets.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  final colorFilter = const ColorFilter.mode(
    Colors.grey,
    BlendMode.srcIn,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Discover Links',
      ),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset('assets/icons/discover2.svg'),
            title: Text(
              'Static pages',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.discoverStatic),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Discover Sections',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            title: const Text('Discover Tab'),
            leading: SvgPicture.asset(
              IconAssets.discover,
              width: 34,
              colorFilter: colorFilter,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              const link = Link(
                id: '0',
                name: 'Discover',
                link: 'https://uat-links.devtest.vegas/discover',
                path: Constants.discoverPath,
              );
              context.pushNamed(
                Routes.createPageDeepLink,
                extra: link,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconAssets.dining,
              colorFilter: colorFilter,
            ),
            title: const Text('Dining'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.dining),
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconAssets.entertainment,
              colorFilter: colorFilter,
            ),
            title: const Text('Entertainment'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.entertainment),
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconAssets.nightlife,
              colorFilter: colorFilter,
            ),
            title: const Text('Nightlife'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.nightlife),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Discover PDPs',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/dining.svg'),
            title: const Text('Restaurants'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.restaurants),
          ),
          ListTile(
            leading: SvgPicture.asset(IconAssets.entertainment),
            title: const Text('Shows'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.shows),
          ),
          ListTile(
            title: const Text('Clubs'),
            leading: SvgPicture.asset(IconAssets.nightlife),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.clubs),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
