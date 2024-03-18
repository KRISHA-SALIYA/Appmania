import 'package:flutter/material.dart';

import '../../utils/products_utils.dart';
import '../../utils/routes_utils.dart';
import 'favourite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homepageState();
}

class _homepageState extends State<HomePage> {
  double borderradius = 15;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false.
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FavouritePage(),
                ),
              );
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text(
          "My Users",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.blue.shade900,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                allUsers.length,
                (index) => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.detailPage,
                            arguments: allUsers[index],
                          );
                        },
                        child: Container(
                          height: h * 0.1,
                          width: w * 0.4,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white70,
                            shape: BoxShape.rectangle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            allUsers[index]['firstName'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: h * 0.2,
                        width: w * 0.4,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: NetworkImage(
                              allUsers[index]['image'],
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
