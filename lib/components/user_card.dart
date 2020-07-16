import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String tagline;
  final String imageUrl;

  UserCard({this.name, this.tagline, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          imageUrl,
        ),
        title: Text(name),
        subtitle: Text(tagline),
      ),
    );
  }
}
