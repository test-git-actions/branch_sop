import 'package:branch_links/core/constants/assets.dart';
import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/presentation/widgets/text_environment.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/main/widgets/env_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch Links'),
        actions: [
          if (Env().isDevApp)
            const EnvDropDownMenu()
          else
            const TextEnvironment(),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset(IconAssets.home),
            title: const Text('Home'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.home),
          ),
          const Divider(),
          ListTile(
            title: const Text('Check In'),
            leading: SvgPicture.asset(
              IconAssets.checkin,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.createDeepLink),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(IconAssets.discover),
            title: const Text('Discover'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.discover),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(IconAssets.trips),
            title: const Text('Trips'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.trips),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(IconAssets.rewards),
            title: const Text('Rewards'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.rewards),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(IconAssets.rewards),
            title: const Text('Challenge'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.challenge),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(IconAssets.me),
            title: const Text('Me'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.me),
          ),
          const Divider(),
          ListTile(
            leading: SvgPicture.asset(
              IconAssets.other,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            title: const Text('Other'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.other),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.link, color: Colors.grey),
            title: const Text('Deep Link Inspector'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(Routes.generatedLinkDetails),
          ),
        ],
      ),
    );
  }
}
