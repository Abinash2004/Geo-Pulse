import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;

  const ProfileInfoTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}