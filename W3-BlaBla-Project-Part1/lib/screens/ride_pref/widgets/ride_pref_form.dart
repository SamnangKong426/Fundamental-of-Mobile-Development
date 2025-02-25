import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/widgets/navigation/location_picker.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/actions/bla_button.dart';
import '../../../utils/animations_util.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;
  final Function(Location)? onLocationSelected;

  const RidePrefForm({super.key, this.initRidePref, this.onLocationSelected});

  // Add this static method to show the form in a dialog
  static Future<RidePref?> showRidePrefForm(BuildContext context,
      {RidePref? initRidePref}) async {
    return showDialog<RidePref>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: RidePrefForm(initRidePref: initRidePref),
        );
      },
    );
  }

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  final uniqueFakeLocations = fakeLocations.toSet().toList();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------
  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departureDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  bool isFormValid() {
    return departure != null && arrival != null && requestedSeats > 0;
  }

  void switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
      });
    }
  }

  // Update this method to pop back to the form when a city is selected
  void navigateToLocationPicker(
      BuildContext context, Function(Location) onLocationSelected) {
    Navigator.of(context)
        .push(AnimationsUtil.createBottomToTopRoute(LocationPicker(
      locations: uniqueFakeLocations,
      onLocationSelected: (location) {
        onLocationSelected(location);
        if (widget.onLocationSelected != null) {
          widget.onLocationSelected!(location);
        }
        Navigator.of(context).pop(); // Pop back to the form
      },
    )));
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEE d MMM');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => navigateToLocationPicker(context, (location) {
                  setState(() {
                    departure = location;
                  });
                }),
                child: AbsorbPointer(
                  child: DropdownButton<Location>(
                    hint: Text('Select Departure'),
                    value: uniqueFakeLocations.contains(departure)
                        ? departure
                        : null,
                    items: uniqueFakeLocations.map((location) {
                      return DropdownMenuItem<Location>(
                        value: location,
                        child: Text(location.name),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    icon: null, // Remove the dropdown icon
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.swap_vert),
              onPressed: switchLocations,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => navigateToLocationPicker(context, (location) {
            setState(() {
              arrival = location;
            });
          }),
          child: AbsorbPointer(
            child: DropdownButton<Location>(
              hint: Text('Select Arrival'),
              value: uniqueFakeLocations.contains(arrival) ? arrival : null,
              items: uniqueFakeLocations.map((location) {
                return DropdownMenuItem<Location>(
                  value: location,
                  child: Text(location.name),
                );
              }).toList(),
              onChanged: (value) {},
              icon: null, // Remove the dropdown icon
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () => selectDate(context),
            ),
            Text(
              dateFormat.format(departureDate),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Requested Seats',
            icon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              requestedSeats = int.tryParse(value) ?? 1;
            });
          },
        ),
        BlaButton(
          text: 'Search',
          onPressed: isFormValid()
              ? () {
                  final ridePref = RidePref(
                    departure: departure!,
                    departureDate: departureDate,
                    arrival: arrival!,
                    requestedSeats: requestedSeats,
                  );
                  // Add the ridePref to the history
                  fakeRidePrefs.add(ridePref);
                  Navigator.of(context).pop(ridePref); // Return the ridePref
                }
              : () {},
        ),
      ],
    );
  }
}
