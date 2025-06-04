import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyLinkButton extends StatelessWidget {
  final String link;
  final bool small;
  const CopyLinkButton({
    required this.link,
    this.small = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('CopyButton'),
      icon: Icon(
        Icons.copy,
        size: small ? 20 : 26,
      ),
      onPressed: () {
        Clipboard.setData(
          ClipboardData(text: link),
        ).then((value) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Deep Link copied!'),
            ),
          );
        });
      },
    );
  }
}
