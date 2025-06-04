import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:flutter/material.dart';
import 'package:vega_tokens/vega_tokens.dart';
import 'package:intl/intl.dart';

class AllMetadataWidget extends StatelessWidget {
  final String link;
  final LinkDetails details;

  const AllMetadataWidget({
    super.key,
    required this.link,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Metadata',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: VegaSizing.size1x),
        Text('ID: ${details.id}'),
        const Divider(),
        Text('Feature: ${details.feature}'),
        const Divider(),
        Text(
          'Deep Link Path: ${Uri.decodeFull(details.deepLinkPath.toString())}',
        ),
        const Divider(),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final queryParameter =
                details.deepLinkPath.queryParameters.entries.elementAt(index);

            return Text(
              '${toBeginningOfSentenceCase(queryParameter.key)}: ${Uri.decodeFull(queryParameter.value)}',
            );
          },
          itemCount: details.deepLinkPath.queryParameters.entries.length,
          separatorBuilder: (_, __) => const Divider(),
        ),
        const Divider(),
        Text('Title: ${details.metadata.title}'),
        const Divider(),
        Text('Description: ${details.metadata.description}'),
        const Divider(),
        Text('Image URL: ${details.metadata.imageURL}'),
        const Divider(),
        Text('Image Height: ${details.metadata.imageHeight}'),
        const Divider(),
        Text('Image Width: ${details.metadata.imageWidth}'),
        const Divider(),
        const SizedBox(height: VegaSizing.size2x),
      ],
    );
  }
}
