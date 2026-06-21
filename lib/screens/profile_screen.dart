import 'package:flutter/material.dart';
import 'package:user_directory_api/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=${user.id}",
              ),
            ),
            SizedBox(height: 20),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(user.email,
            style: TextStyle(fontSize: 16, color:Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
