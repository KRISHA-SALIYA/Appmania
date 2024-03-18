import 'package:flutter/material.dart';

import '../../utils/products_utils.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue.shade300,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...favourit
                  .map(
                    (e) => Container(
                      height: size.height * 0.22,
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        image: DecorationImage(
                          image: NetworkImage(
                            e['image'],
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _itemCount--;
                        },
                      );
                    },
                  ),
                  Text(
                    _itemCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(
                        () {
                          _itemCount++;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
