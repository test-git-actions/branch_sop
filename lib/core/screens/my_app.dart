import 'package:branch_links/core/navigation/go_router.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routerConfig: Routes.goRouter,
    );
  }
}
