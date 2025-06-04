import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/features/link_details/screens/cubit/link_details_cubit.dart';
import 'package:branch_links/features/link_details/screens/widgets/metadata_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class LinkDetailsScreen extends StatelessWidget {
  const LinkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LinkDetailsCubit(),
      child: const LinkDetailsWidget(),
    );
  }
}

class LinkDetailsWidget extends StatefulWidget {
  const LinkDetailsWidget({super.key});

  @override
  State<LinkDetailsWidget> createState() => _LinkDetailsWidgetState();
}

class _LinkDetailsWidgetState extends State<LinkDetailsWidget> {
  final controller = TextEditingController();

  var isLinkEmpty = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Deep Link Inspector'),
      body: Padding(
        padding: const EdgeInsets.all(VegaSizing.size4x),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: VegaSizing.size2x),
              VegaDefaultInput(
                key: const Key('LinkTextFormField'),
                controller: controller,
                label: 'Link',
                error: isLinkEmpty ? 'This field should not be empty' : '',
              ),
              const SizedBox(height: VegaSizing.size2x),
              VegaButton(
                variant: VegaButtonVariant.primary,
                onPressed: () {
                  if (controller.text.isEmpty) {
                    setState(() {
                      isLinkEmpty = true;
                    });
                    return;
                  }
                  context
                      .read<LinkDetailsCubit>()
                      .getGeneratedLinkDetails(controller.text);
                },
                text: 'Get Details',
              ),
              const SizedBox(height: VegaSizing.size2x),
              BlocBuilder<LinkDetailsCubit, LinkDetailsState>(
                builder: (context, state) {
                  return switch (state) {
                    LinkDetailsInitial() => const SizedBox(),
                    LinkDetailsLoading() => const CircularProgressIndicator(),
                    LinkDetailsLoaded(:final link, :final linkDetails) =>
                      MetadataWidget(
                        link: link,
                        details: linkDetails,
                      ),
                    LinkDetailsError() => const Text(
                        'Something went wrong... Are you in the right environment?',
                      ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
