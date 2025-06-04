import 'package:branch_links/core/links/data/models/link.dart';
import 'package:flutter/material.dart';
import 'package:vega_tokens/vega_tokens.dart';

class LinkListTileWidget extends StatelessWidget {
  const LinkListTileWidget({
    required this.detailLink,
    this.onAddPressed,
    super.key,
  });

  final Link detailLink;
  final Function? onAddPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        detailLink.name,
        style: VegaSemanticTypographies.labelSemiboldS
            .copyWith(overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        detailLink.link,
        style: VegaSemanticTypographies.bodyRegularS
            .copyWith(overflow: TextOverflow.ellipsis, color: Colors.black54),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (onAddPressed != null)
              ? IconButton(
                  key: const Key('AddLinkButton'),
                  onPressed: () {
                    onAddPressed!();
                  },
                  icon: const Icon(Icons.add_link),
                  iconSize: 20,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
