import 'package:flutter/material.dart';
import 'package:v_commerce_vendor/register/presentation/pages/register_screen.dart';
import 'package:v_commerce_vendor/ui_pages.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kRegisterScreenPath:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
