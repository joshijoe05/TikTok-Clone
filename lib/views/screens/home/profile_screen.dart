import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String id;
  const ProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('User - $id'),
      ),
    );
  }
}
