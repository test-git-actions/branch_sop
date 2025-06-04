import 'package:branch_links/env.dart';
import 'package:flutter/material.dart';
import 'package:vega_tokens/vega_tokens.dart';

class EnvDropDownMenu extends StatelessWidget {
  final Function(Environment)? onChanged;

  const EnvDropDownMenu({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Environment>(
      width: 120,
      enabled: Env().isDevApp,
      initialSelection: Env().environment,
      textStyle:
          VegaSemanticTypographies.bodyRegularS.copyWith(color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.white,
      ),
      onSelected: (Environment? env) {
        if (env == null) return;
        Env().environment = env;
        onChanged?.call(env);
      },
      dropdownMenuEntries:
          Env.devEnvironments.map<DropdownMenuEntry<Environment>>(
        (Environment env) {
          return DropdownMenuEntry<Environment>(
            value: env,
            label: env.name.toUpperCase(),
          );
        },
      ).toList(),
    );
  }
}
