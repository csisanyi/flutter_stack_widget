import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const CustomStackApp());
}

class CustomStackApp extends StatelessWidget {
  const CustomStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomStackHome(),
    );
  }
}

class CustomStackHome extends StatefulWidget {
  final StackBaseListView stackBaseListView = const StackBaseListView();
  const CustomStackHome({super.key});

  @override
  State<CustomStackHome> createState() => _CustomStackHomeState();
}

class _CustomStackHomeState extends State<CustomStackHome> {
  bool toggle = false;

  void toggleFun() {
    setState(() {
      toggle = toggle ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Toggle"),
        actions: [
          FloatingActionButton(
            onPressed: toggleFun,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          widget.stackBaseListView,
          toggle ?
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('Item $index'),
                ),
              );
            },
          )
              :
              Container()
        ],
      ),
    );
  }
}

class StackBaseListView extends StatelessWidget {
  const StackBaseListView({super.key});

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10, // Replace with the actual number of items
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            padding: EdgeInsets.only(bottom: 10),
            color: getRandomColor(), // Set a random color for each item
          );
        });
  }
}
