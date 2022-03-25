import 'package:flutter/material.dart';

import '../locator.dart';
import '../routing/navigationService.dart';
import '../routing/router.dart';
import 'loginSignup/layoutTemplateLogin/layoutTemplateLogin.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: 'login',
      ),
    );
  }
}
