import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:user_directory_api/models/user.dart';
import 'package:user_directory_api/screens/profile_screen.dart';
import 'package:user_directory_api/services/api_service.dart';
import 'package:user_directory_api/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"), centerTitle: true),
      body: FutureBuilder(
        future: users,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text("Loading Users..."),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.wifi_off, size: 80),

                  const SizedBox(height: 20),

                  Text(
                    snapshot.error.toString().replaceAll("Exception: ", ""),

                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      )
                    ),
                    onPressed: _retryFetch,

                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          
          final users = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _refreshUsers,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=${user.id}",
                    ),
                  ),
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user.email),
                  trailing: Text(user.id.toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(user: user),
                      ),
                    );
                  },
                ).animate().slideX(begin: 0.5, end: 0, duration: 500.ms);
              },
            ),
          );
        }),
      ),
    );
  }

  Future<void> _refreshUsers() async {
    setState(() {
      users = ApiService().fetchUsers();
    });
    await users;
  }

  Future<void> _retryFetch() async {
    setState(() {
      users = ApiService().fetchUsers();
    });
  }
}
