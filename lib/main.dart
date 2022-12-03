import 'package:flutter/material.dart';
import '../screens/error_screen.dart';
import './utils/app_routes.dart';
import './utils/theme_data_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeDataManager.getTheme,
      // home: const TabScreen(),
      routes: AppRoutes.getRoutes,
      initialRoute: '/', // Same as home.
      // onGenerateRoute: (settings) => Executes unregistered routes. Can be used on Dynamic Screens.
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => const ErrorScreen());
      // } // Fallback Screen like 404.
    );
  }
}
