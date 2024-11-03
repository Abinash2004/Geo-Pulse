import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Account/My_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyListTile(
              title: "Notification",
              leadingIcon: Icon(Icons.notifications_on),
              trailingIcon: Icon(Icons.arrow_right_rounded),
            ),
            MyListTile(
              title: "Privacy",
              leadingIcon: Icon(Icons.lock_outline),
              trailingIcon: Icon(Icons.arrow_right_rounded),
            ),
            MyListTile(
              title: "Backup & Restore",
              leadingIcon: Icon(Icons.cloud_download),
              trailingIcon: Icon(Icons.arrow_right_rounded),
            ),
            MyListTile(
              title: "Help & Support",
              leadingIcon: Icon(Icons.help),
              trailingIcon: Icon(Icons.arrow_right_rounded),
            ),
            MyListTile(
              title: "About",
              leadingIcon: Icon(Icons.info),
              trailingIcon: Icon(Icons.arrow_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
