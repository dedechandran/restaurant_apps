import 'package:flutter/material.dart';
import 'package:restaurant_apps/restaurant_details_screen.dart';
import 'package:restaurant_apps/restaurant_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Apps',
      initialRoute: RestaurantHomeScreen.routeName,
      routes: {
        RestaurantHomeScreen.routeName: (context) => const RestaurantHomeScreen(),
        RestaurantDetailsScreen.routeName: (context) => const RestaurantDetailsScreen()
      },
    );
  }
}
