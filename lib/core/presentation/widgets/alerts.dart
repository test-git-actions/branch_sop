import 'package:flutter/material.dart';
import 'package:vega_components/vega_components.dart';

class Alerts {
  static Future<bool?> showDecisionAlert(
    BuildContext context,
    String title, {
    String? description,
  }) async {
    final res = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: description != null ? Text(description) : const SizedBox(),
        actions: [
          VegaButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            text: 'No',
            variant: VegaButtonVariant.secondary,
          ),
          VegaButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            text: 'Yes',
            variant: VegaButtonVariant.primary,
          ),
        ],
      ),
    );
    return res;
  }
}
