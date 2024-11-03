import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Account/Media_Service.dart';
import 'package:geopulse/Frontend/Components/Account/const.dart';
import 'package:geopulse/Frontend/Components/Home/my_button.dart';
import 'package:geopulse/Frontend/Components/Account/my_textfield.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class Editprofilepage extends StatefulWidget {
  const Editprofilepage({super.key});

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final GetIt getIt = GetIt.instance;
  late MediaService mediaService;
  File? selectImage;
  @override
  void initState() {
    super.initState();
    mediaService = getIt.get<MediaService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Edit Profile',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.surface,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                pfpSelectionField(),
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    children: [
                      MyTextfield(
                        controller: nameController,
                        hintText: "Enter your name",
                        labelText: "Name",
                        obscureText: false,
                        icon: const Icon(Icons.account_circle),
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: idController,
                        hintText: "Enter your User Id",
                        labelText: "user Id",
                        obscureText: false,
                        icon: const Icon(Icons.insert_drive_file_rounded),
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: emailController,
                        hintText: "Email",
                        labelText: "Enter your Email",
                        obscureText: false,
                        icon: const Icon(Icons.email),
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: phoneController,
                        hintText: "Phone Number",
                        labelText: "Enter your Phone Number",
                        obscureText: false,
                        icon: const Icon(Icons.phone),
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: designationController,
                        hintText: "Designation",
                        labelText: "Enter your Designation",
                        obscureText: false,
                        icon: const Icon(Icons.design_services),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                MyButton(text: "Save", ontap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pfpSelectionField() {
    return GestureDetector(
      onTap: () async {
        File? file = await mediaService.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectImage = file;
          });
        }
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.20,
        backgroundImage: selectImage != null
            ? FileImage(selectImage!)
            : NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
      ),
    );
  }
}
