import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.video_call,
            ),
            onPressed: () {},
          ),
          const Icon(Icons.audiotrack)
        ],
        title: const Text('Test App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SafeArea(
          child: Column(
        children: [
          Text('Hi'),
        ],
      )),
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ]),
    );
  }
}
