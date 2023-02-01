import 'package:flutter/material.dart';
import 'package:food_dept_bd/screens/verification.dart';

import '../config/config.dart';
// import '../screens/Error/error.dart';
import '../screens/login/login_page.dart';
import '../screens/success/success.dart';
import '../screens/valid_info_success/valid_info_success.dart';
import '../screens/verify_img/verify_img.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => SuccessPage());
      case verifyRoute:
        return MaterialPageRoute(builder: (_) => Verification());
      case verifyImgRoute:
        return MaterialPageRoute(builder: (_) => VerifyImg());
      case validInfoSuccessRoute:
        return MaterialPageRoute(builder: (_) => ValidInfoSuccess());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
