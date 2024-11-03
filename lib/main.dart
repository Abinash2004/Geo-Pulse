import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geopulse/Backend/authentication.dart';
import 'package:geopulse/Frontend/Admin%20Pages/admin_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geopulse/Frontend/Components/Account/Media_Service.dart';
import 'package:geopulse/Frontend/Employee%20Pages/my_home_page.dart';
import 'package:geopulse/Frontend/sign_in_page.dart';
import 'package:geopulse/Frontend/Themes/color_palette.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GetIt getIt=GetIt.instance;
  getIt.registerSingleton<MediaService>(MediaService());
  runApp(MultiProvider(
    providers: [
      //theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static String userID = "";
  static String name = "";
  static String email = "";
  static String phone = "";
  static String user = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'geopulse Pulse',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            // Use FutureBuilder to wait for fetchUserData() to complete
            return FutureBuilder(
              future: fetchUserData(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 5)); // Show a loading indicator
                }
                if (MyApp.user == "admin") {
                  return const AdminHomePage();
                } else {
                  return const HomePage();
                }
              },
            );
          }
          return const MySignIn();
        },
      ),
    );
  }
}