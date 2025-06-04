import 'package:vega_tokens/vega_tokens.dart';
import 'package:flutter/material.dart';

class DiningOptionWidget extends StatelessWidget {
  const DiningOptionWidget({
    required this.title,
    required this.isActive,
    this.onTap,
    super.key,
  });

  final String title;
  final bool isActive;
  final Function(bool isActive)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const SizedBox(
          width: VegaSizing.size1x,
        ),
        Switch(
          value: isActive,
          onChanged: onTap,
          activeColor: Theme.of(context).primaryColor,
          inactiveThumbColor: Colors.grey[600],
          inactiveTrackColor: Colors.grey[200],
        ),
      ],
    );
  }
}
