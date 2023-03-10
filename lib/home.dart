import 'package:flutter/material.dart';
import 'package:version_1/extra.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  String img =
      "https://images.pexels.com/photos/902030/pexels-photo-902030.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: tiles(img, "Dress", "Rs. 1000"),
      ),
    );
  }

  Widget tiles(String image, String title, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: 250,
      width: 200,
      child: Column(
        children: [
          // Image.network(
          //   image,
          //   fit: BoxFit.cover,
          //   height: 200,
          //   width: 200,
          // ),
          MaterialButton(
            color: Colors.amber,
            onPressed: () {},
          ),
          Text(price),
        ],
      ),
      // color: Colors.red,
    );
  }
}
