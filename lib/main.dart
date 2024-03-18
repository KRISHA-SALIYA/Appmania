import 'package:flutter/material.dart';
import 'package:super_users/utils/routes_utils.dart';
import 'package:super_users/views/screens/detail_page.dart';
import 'package:super_users/views/screens/favourite_page.dart';
import 'package:super_users/views/screens/home_page.dart';
import 'package:super_users/views/screens/welcome_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.welcomePage: (context) => const WelcomePage(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.favouritePage: (context) => const FavouritePage(),
      },
    );
  }
}
