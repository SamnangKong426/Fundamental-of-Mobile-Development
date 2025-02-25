import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride/ride_screen.dart';
// Add the following imports
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

class RidesScreen extends StatelessWidget {
  final List<String> matchingRides;

  RidesScreen({required this.matchingRides});

  void _navigateToRideScreen(BuildContext context, String ride) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RideScreen(
        rides: [], // Pass the actual list of rides here
        onRideSelected: (selectedRide) {
          // Handle ride selection
        },
        ridePref: RidePref(
          departure: Location(name: 'Departure', country: Country.france),
          departureDate: DateTime.now(),
          arrival: Location(name: 'Arrival', country: Country.france),
          requestedSeats: 1,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matching Rides'),
      ),
      body: ListView.builder(
        itemCount: matchingRides.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchingRides[index]),
            onTap: () => _navigateToRideScreen(context, matchingRides[index]),
          );
        },
      ),
    );
  }
}
