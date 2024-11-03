import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Home/my_card.dart';
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
      "icon": Icons.login_rounded,
    },
    {
      "title": "Check Out",
      "icon": Icons.logout_rounded,
    },
    {
      "title": "Manual\nCheck In",
      "icon": Icons.login_rounded,
    },
    {
      "title": "Manual\nCheck Out",
      "icon": Icons.logout_rounded,
    },
    {
      "title": "Today's Attendance",
      "icon": Icons.today_rounded,
    },
    {
      "title": "Attendance Record",
      "icon": Icons.history_rounded,
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
              fontWeight: FontWeight.w600,
            )),
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
              index: index.toString(), // Change - index is sent to the MyCard widget for separate functionality
              title: option["title"]!,
              icon: option["icon"]!,
            );
          },
        ),
      ),
    );
  }
}