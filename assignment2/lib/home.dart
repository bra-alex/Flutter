import 'package:flutter/material.dart';
import 'package:assignment2/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggedIn = false;
  String? profilePicture =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqb1cpENzAUc1SnTZkgZ_cQm6IlatQBlmYjQ&usqp=CAU';
  // String? profilePicture;

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: profilePicture == null
                    ? const DecorationImage(
                        image: AssetImage('assets/images/img.jpg'))
                    : DecorationImage(image: NetworkImage(profilePicture!))),
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          isLoggedIn
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Welcome, Alex',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'App under construction...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
}
