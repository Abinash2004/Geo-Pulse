import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Admin%20Pages/admin_home.dart';
import 'package:geopulse/Frontend/Employee%20Pages/my_home_page.dart';
import 'package:geopulse/Frontend/sign_in_page.dart';
import 'package:geopulse/main.dart';

Future<void> login(email, password, context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      print(FirebaseAuth.instance.currentUser!.email);
      await fetchUserData();
      if (MyApp.user == "admin") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminHomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

void logoutConfirmation(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          title: const Text("Logout?",
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
                child: const Text("No",style: TextStyle(fontSize: 22, color: Colors.red))),
            TextButton(
                onPressed: () {
                  logout(context);
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ))
          ],
        );
      });
}

Future<void> logout(context) async {
  try {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MySignIn()));
    });
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

Future<void> fetchUserData() async {
  try {
    final databaseRef = FirebaseDatabase.instance.ref();
    final email = FirebaseAuth.instance.currentUser!.email;

    var databaseSnapshot = await databaseRef
        .child('user')
        .child(email.toString().split('.').first)
        .get();
    if (databaseSnapshot.value != null) {
      MyApp.name = databaseSnapshot.child('name').value.toString();
      MyApp.email = databaseSnapshot.child('email').value.toString();
      MyApp.phone = databaseSnapshot.child('phone').value.toString();
      MyApp.user = databaseSnapshot.child('user').value.toString();
      MyApp.userID = databaseSnapshot.child('userID').value.toString();
    }
  } on FirebaseException catch (e) {
    print(e.message);
  }
}
