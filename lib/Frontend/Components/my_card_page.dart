import 'package:flutter/material.dart';
import 'package:geopulse/Backend/authentication.dart';
import 'package:geopulse/Frontend/Components/my_card.dart';
import 'package:geopulse/main.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<Map<String, dynamic>> cardOptions = [
    {
      "title": "Check In",
      "icon": Icons.login,
    },
    {
      "title": "Check Out",
      "icon": Icons.logout,
    },
    {
      "title": "Today's Attendance",
      "icon": Icons.today,
    },
    {
      "title": "Attendance Record",
      "icon": Icons.history,
    },
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: cardOptions.length,
          itemBuilder: (context, index) {
            final option = cardOptions[index];
            return MyCard(
              title: option["title"]!,
              icon: option["icon"]!,
            );
          },
        ),
      ),
    );
  }
}
