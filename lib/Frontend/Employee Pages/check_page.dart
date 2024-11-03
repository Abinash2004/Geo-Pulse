import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Employee%20Pages/my_home_page.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    // this is temporary page to show that user is inside the proximity
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              icon: Icon(Icons.home,color: Theme.of(context).colorScheme.surface),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const HomePage()),(Route<dynamic> route) => false);
              }),
        ],
      ),
      body: const Center(
        child: Text('Attendance Logged'),
      ),
    );
  }
}
