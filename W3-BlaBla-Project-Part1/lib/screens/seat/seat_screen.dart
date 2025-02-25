import 'package:flutter/material.dart';
import '../../model/ride/ride.dart';

class SeatScreen extends StatelessWidget {
  final Ride ride;
  final Function(int) onSeatSelected;

  const SeatScreen(
      {super.key, required this.ride, required this.onSeatSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seat'),
      ),
      body: ListView.builder(
        itemCount: ride.availableSeats,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Seat ${index + 1}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SeatSelectionPage(
                    initialSeat: index + 1,
                    onSeatSelected: onSeatSelected,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SeatSelectionPage extends StatefulWidget {
  final int initialSeat;
  final Function(int) onSeatSelected;

  const SeatSelectionPage(
      {super.key, required this.initialSeat, required this.onSeatSelected});

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  late int selectedSeat;

  @override
  void initState() {
    super.initState();
    selectedSeat = widget.initialSeat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Number of Seats'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (selectedSeat > 1) selectedSeat--;
                });
              },
            ),
            Text('$selectedSeat', style: TextStyle(fontSize: 24)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  selectedSeat++;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSeatSelected(selectedSeat);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
