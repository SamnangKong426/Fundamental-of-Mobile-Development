import 'package:flutter/material.dart';
import '../../model/ride/ride.dart';

class RideScreen extends StatelessWidget {
  final List<Ride> rides;
  final Function(Ride) onRideSelected;

  const RideScreen(
      {super.key, required this.rides, required this.onRideSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Rides'),
      ),
      body: ListView.builder(
        itemCount: rides.length,
        itemBuilder: (context, index) {
          return RideTile(
            ride: rides[index],
            onPressed: () {
              onRideSelected(rides[index]);
            },
          );
        },
      ),
    );
  }
}

class RideTile extends StatelessWidget {
  final Ride ride;
  final VoidCallback onPressed;

  const RideTile({super.key, required this.ride, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text('${ride.departureLocation.name} → ${ride.arrivalLocation.name}'),
      subtitle: Text(
          'Departure: ${ride.departureDate}\nSeats: ${ride.remainingSeats}'),
      trailing: Text('\$${ride.pricePerSeat.toStringAsFixed(2)}'),
      onTap: onPressed,
    );
  }
}
