import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import '../../model/ride/locations.dart';
import '../../widgets/navigation/location_picker.dart';

class LocationPickerTestScreen extends StatelessWidget {
  const LocationPickerTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Picker Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LocationPicker(
          locations: fakeLocations,
          onLocationSelected: (location) {
            print('Selected location: $location');
          },
        ),
      ),
    );
  }
}