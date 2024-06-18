import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: ListView(
        children: List.generate(
          10000,
          (i) => ListTile(
            title: Text('Item $i'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('This is a subtitle'),
                Text('This is another subtitle'),
              ],
            ),
            onTap: () {
              // Handle navigation to a specific route
            },
          ),
        ),
      ),
    );
  }
}
