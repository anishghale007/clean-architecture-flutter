import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:v_commerce_vendor/register/presentation/pages/register_screen.dart';
import 'package:v_commerce_vendor/router.dart';
import 'package:v_commerce_vendor/ui_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) =>
          Routers.generateRoute(settings),
      initialRoute: kRegisterScreenPath,
      home: const Scaffold(
        body: RegisterScreen(),
      ),
    );
  }
}
