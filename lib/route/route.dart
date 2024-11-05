import 'package:flutter/material.dart';
import 'package:login/route/routes_name.dart';
import 'package:login/ui/coures_screen/course_screen.dart';
import 'package:login/ui/signup_screen/signup_screen.dart';

import '../ui/login_screen/login_screen.dart';



class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case routeName.loginScreen:
        return MaterialPageRoute(builder: (context) =>  LoginScreen());
      case routeName.signupScreen:
        return MaterialPageRoute(builder: (context) =>  const SignupScreen());
      case routeName.courseScreen:
        return MaterialPageRoute(builder: (context) =>   CourseScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No routes found'),
                  ),
                ));
    }
  }
}
