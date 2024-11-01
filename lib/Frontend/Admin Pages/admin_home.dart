import 'package:flutter/material.dart';
import 'package:geopulse/Backend/authentication.dart';
import 'package:geopulse/main.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(MyApp.name,
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600, // You can also use FontWeight.w500, w600, etc.
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: Theme.of(context).colorScheme.surface), // Icon for notifications
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: const Center(child: Text("Admin HomePage"))
    );
  }
}