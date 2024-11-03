import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geopulse/Backend/authentication.dart';
import 'package:geopulse/Frontend/Components/Account/ProfileInfo_tile.dart';
import 'package:geopulse/Frontend/Components/Account/Profile_piture.dart';
import 'package:geopulse/Frontend/Components/Account/const.dart';
import 'package:geopulse/Frontend/Components/Home/my_button.dart';
import 'package:geopulse/Frontend/Employee%20Pages/EditProfilePage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
   File? selectedImage;
  final GetIt getIt = GetIt.instance;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile page',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w600,
          )
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ProfilePicture(
                  imageUrl: selectedImage != null ? selectedImage!.path : PLACEHOLDER_PFP,
                ),
                const SizedBox(height: 10),
                const ProfileInfoTile(title: 'Name'),
                const ProfileInfoTile(title: 'Employee ID'),
                const ProfileInfoTile(title: 'Email'),
                const ProfileInfoTile(title: 'Phone number'),
                const ProfileInfoTile(title: 'Designation'),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "Edit Profile", 
                      ontap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const Editprofilepage()),
                        );
                      }
                    ),
                    const SizedBox(width: 20),
                    MyButton(
                      text: "Logout",
                      ontap: () {
                        logoutConfirmation(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


