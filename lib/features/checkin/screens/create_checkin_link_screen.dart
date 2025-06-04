import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/checkin/cubit/create_checkin_link_cubit.dart';
import 'package:branch_links/features/checkin/screens/widgets/create_checkin_link_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCheckinLinkScreen extends StatelessWidget {
  const CreateCheckinLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateCheckinLinkCubit()),
        BlocProvider(create: (context) => AnalyticsKeysCubit()),
      ],
      child: const DeepLinkCreationWidget(),
    );
  }
}

class DeepLinkCreationWidget extends StatelessWidget {
  const DeepLinkCreationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Check-In Link',
      ),
      body: CreateCheckinLinkForm(),
    );
  }
}
