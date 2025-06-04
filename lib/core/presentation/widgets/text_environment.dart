import 'package:branch_links/env.dart';
import 'package:flutter/material.dart';
import 'package:vega_tokens/vega_tokens.dart';

class TextEnvironment extends StatelessWidget {
  const TextEnvironment({super.key});

  @override
  Widget build(BuildContext context) {
    final isProd = Env().isProdApp;
    return Center(
      child: Container(
        decoration: isProd
            ? const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              )
            : null,
        margin: const EdgeInsets.only(right: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isProd)
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.rocket_launch,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            Text(
              Env().environment.name.toUpperCase(),
              style: VegaSemanticTypographies.bodySemiboldS
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
