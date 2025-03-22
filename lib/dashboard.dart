import 'package:flutter/material.dart';
import 'package:schoolapp/googleauthservice.dart';

class Dashboard extends StatelessWidget {
  final GoogleAuthService _googleAuthService = GoogleAuthService();

  Dashboard({super.key});

  void _logout(BuildContext context) async {
    await _googleAuthService.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: const Center(child: Text("Welcome to Dashboard!")),
    );
  }
}
