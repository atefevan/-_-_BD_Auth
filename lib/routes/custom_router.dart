import 'package:flutter/material.dart';

import '../config/config.dart';
// import '../screens/Error/error.dart';
import '../screens/login/login_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
