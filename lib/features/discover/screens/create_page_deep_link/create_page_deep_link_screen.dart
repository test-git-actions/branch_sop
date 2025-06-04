import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/cubit/create_page_deep_link_cubit.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/widgets/create_page_deep_link_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePageDeepLinkScreen extends StatelessWidget {
  const CreatePageDeepLinkScreen({
    required this.link,
    super.key,
  });

  final Link link;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreatePageDeepLinkCubit>(
          create: (context) => CreatePageDeepLinkCubit(link: link),
        ),
        BlocProvider(create: (_) => AnalyticsKeysCubit()),
      ],
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'Create Page Deep Link',
        ),
        body: CreatePageDeepLinkForm(),
      ),
    );
  }
}
