import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Account/Media_Service.dart';
import 'package:geopulse/Frontend/Components/Account/Profile_piture.dart';
import 'package:geopulse/Frontend/Components/Account/const.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
  final GetIt getIt = GetIt.instance;
  late MediaService mediaService;
  @override
  void initState() {
    super.initState();
    mediaService = getIt<MediaService>();
  }
  Future<void> pickImage() async {
    File? file = await mediaService.getImageFromGallery();
    if (file != null) {
      setState(() {
        selectedImage = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ProfilePicture(
                imageUrl: selectedImage != null ? selectedImage!.path : PLACEHOLDER_PFP,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
