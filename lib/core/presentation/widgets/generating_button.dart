import 'package:vega_components/vega_components.dart';
import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    required this.onPressed,
    this.isLoading = false,
    this.label = 'Generate link',
    super.key,
  });

  final bool isLoading;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: VegaButton(
            onPressed: onPressed,
            text: isLoading ? 'Generating' : label,
            hasLoadingIndicator: isLoading,
            variant: VegaButtonVariant.primary,
          ),
        ),
      ],
    );
  }
}
