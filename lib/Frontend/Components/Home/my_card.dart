import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geopulse/Backend/geo_fencing.dart';
import 'package:geopulse/Frontend/Employee%20Pages/CheckOut_form.dart';
import 'package:geopulse/Frontend/Employee%20Pages/Checkin_form.dart';
import 'package:geopulse/Frontend/Employee%20Pages/check_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatefulWidget {
  
  // Location variables
  static const double officeLatitude = 0; // Replace with actual coordinates
  static const double officeLongitude = 0; // Replace with actual coordinates
  static const double geofenceRadius = 100; // Radius in meters

  // Card variables
  final String title;
  final IconData icon;
  final String index;

  const MyCard({
    super.key,
    required this.index, // Added index field to use the cards separately
    required this.title,
    required this.icon,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isInProximity = false;
  bool isLoading = false; // Loading state for progress indicator

  Future<void> checkIn(BuildContext context) async {
    await checkPermissions(context);
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    // Get current position only once with specified accuracy
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5, // Fetch only if moved at least 5 meters
      ),
    );

    print("Latitude : ${position.latitude}");
    print("Longitude : ${position.longitude}");

    // Calculate the distance between the current location and the office location
    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      MyCard.officeLatitude,
      MyCard.officeLongitude,
    );

    setState(() {
      isInProximity = distance <= MyCard.geofenceRadius;
      isLoading = false;
    });

    if (isInProximity) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Check()));
    } else {
      showProximityDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    // Card widget is rapped with InkWell widget which will just provide the onTap functionality to the card widget.
    return InkWell(
      // onTap added for check-in functionality
      onTap: () {
        print("Card Index: ${widget.index}");
        switch(widget.index) {
          case "0": {
            checkIn(context);
            break;
          }
          case "1": {
            print("index: 5");
            break;
          }
          case "2": {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const CheckinForm()));
            break;
          }
          case "3": {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const CheckOut()));
            break;
          }
          case "4": {
            print("index: 4");
            break;
          }
          case "5": {
            print("index: 5");
            break;
          }
          
        }
        if (widget.index == "0") {
        }
      },
      borderRadius:
          BorderRadius.circular(15.0), // Match the card's border radius
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show a CircularProgressIndicator if loading, otherwise show the icon
              if (isLoading)
                CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.surface)
              else
                Icon(
                  widget.icon,
                  size: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              const SizedBox(height: 10),
              // Show a nothing if loading (circularProgressIndicator is show in above code), otherwise show the icon
              if (!isLoading)
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
