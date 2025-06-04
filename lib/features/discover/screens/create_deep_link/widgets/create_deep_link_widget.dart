import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/widgets/create_deep_link_form.dart';
import 'package:flutter/material.dart';

class CreatePdpDeepLinkWidget extends StatelessWidget {
  const CreatePdpDeepLinkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Create Content Details Link'),
      body: CreatePdpDeepLinkForm(),
    );
  }
}
