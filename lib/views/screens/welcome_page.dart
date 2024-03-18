import 'package:flutter/material.dart';

import '../../utils/routes_utils.dart';
import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double imageRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
      ),
      backgroundColor: Colors.blue.shade300,
      body: Center(
        child: Column(
          children: [
            const Text(
              "WELCOME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: const BorderRadius.only(),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 5,
                    color: Colors.blue,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('lib/asset/images/catuser.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(imageRadius),
                    bottomRight: Radius.circular(imageRadius),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 0.9],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: const Column(
                  children: [],
                ),
              ),
            ),
            SizedBox(
              width: 500,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homePage);
              },
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}
