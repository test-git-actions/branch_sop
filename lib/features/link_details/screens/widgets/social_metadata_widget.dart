import 'dart:math';

import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:vega_tokens/vega_tokens.dart';
import 'package:flutter/material.dart';

class SocialMetadataWidget extends StatelessWidget {
  final String link;
  final OGMetadata metadata;

  const SocialMetadataWidget({
    super.key,
    required this.link,
    required this.metadata,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Metadata',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: VegaSizing.size1x),
        SizedBox(
          width: max(
            MediaQuery.of(context).size.width / 3,
            350,
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(VegaSizing.size2x),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Uri.parse(link).host,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    metadata.title ?? '-',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: VegaSizing.size1x),
                  Text(metadata.description ?? '-'),
                  const SizedBox(height: VegaSizing.size1x),
                  if (metadata.imageURL != null)
                    Image.network(metadata.imageURL!),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*class LinkTile extends StatelessWidget {
  final String link;
  final LinkDetails details;

  const LinkTile({
    required this.link,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(VegaSizing.size2x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Uri.parse(link).host,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black54,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              details.metadata.title ?? '-',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: VegaSizing.size1x),
            Text(details.metadata.description ?? '-'),
            const SizedBox(height: VegaSizing.size1x),
            if (details.metadata.imageURL != null)
              Image.network(details.metadata.imageURL!),
          ],
        ),
      ),
    );
  }
}*/
