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
              fontWeight: FontWeight
                  .w600, // You can also use FontWeight.w500, w600, etc.
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.logout,
                color: Theme.of(context)
                    .colorScheme
                    .surface), // Icon for notifications
            onPressed: () {
              //-----CHANGES MADE FROM HERE----
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      title: const Text(
                        "Logout?",
                        style: TextStyle(
                          //----change the font here-----
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(fontSize: 22, color: Colors.red),
                            )),
                        TextButton(
                            onPressed: () {
                              logout(context);
                            },
                            child: const Text(
                              "Yes",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            ))
                      ],
                    );
                  });
              //------TO HERE-------
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