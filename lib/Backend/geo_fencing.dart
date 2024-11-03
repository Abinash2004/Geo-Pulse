import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// check the permission of location
Future<void> checkPermissions(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      await showLocationPermissionDialog(context);
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print("Location is forever denied");
    await showLocationPermissionDialog(context);
    return;
  }

  print('Location permission granted');
}

//show dialog box if location permission is denied
Future<void> showLocationPermissionDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Location Permission Needed'),
        content: const Text(
            'This app needs location access to function properly. Please grant location permission in settings.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Open Settings'),
            onPressed: () {
              Geolocator.openAppSettings(); // Opens app settings
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return Future.error("Location Services are needed");
}

//show dialog box if employee is out side the proximity radius
void showProximityDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('You are outside the office proximity'),
        content: const Text(
            'You need to enter the minimum proximity area of the office to log in your today\'s attendence.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
