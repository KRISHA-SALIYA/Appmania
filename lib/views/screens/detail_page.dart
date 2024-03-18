import 'package:flutter/material.dart';

import '../../utils/products_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> product =
        (ModalRoute.of(context)?.settings.arguments ?? allUsers[0])
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Detail Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              image: DecorationImage(
                image: NetworkImage(
                  product['image'],
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FirstName : ${product['firstName']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "lastName   : ${product["lastName"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Height : ${product["height"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Weight : ${product["weight"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Email : ${product["email"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Phone  : ${product["phone"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          // if (cartItems.contains(product))
          if (favourit.contains(product)) {
            favourit.remove(product);
            snackBar = SnackBar(
              content: Text("${product['firstName']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            favourit.add(product);
            snackBar = SnackBar(
              content: Text("${product['firstName']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.favorite),
        label: const Text("Favourite Friend "),
      ),
    );
  }
}
