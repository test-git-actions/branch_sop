import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/cubit/create_deep_link_cubit.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/widgets/create_deep_link_widget.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePdpDeepLinkScreen extends StatelessWidget {
  const CreatePdpDeepLinkScreen({
    required this.productType,
    required this.link,
    super.key,
  });

  final ProductType productType;
  final Link link;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnalyticsKeysCubit>(create: (_) => AnalyticsKeysCubit()),
        BlocProvider<PropertiesCubit>(
          create: (_) => PropertiesCubit()..getProperties(),
        ),
        BlocProvider<CreatePdpLinkCubit>(
          create: (context) => CreatePdpLinkCubit(
            productType: productType,
            link: link,
          ),
        ),
      ],
      child: const CreatePdpDeepLinkWidget(),
    );
  }
}
