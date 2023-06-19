import 'package:flutter/material.dart';

class RecentPage extends StatelessWidget {
  final List<String> recentLinks;

  RecentPage({required this.recentLinks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('최근 재생 목록'),
      ),
      body: ListView.builder(
        itemCount: recentLinks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentLinks[index]),
            onTap: () {
              // Implement the functionality to open the meditation YouTube link here
            },
          );
        },
      ),
    );
  }
}
