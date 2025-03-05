import 'package:flutter/material.dart';
import 'package:w4_blabla_project_part2/widgets/actions/bla_button.dart';

import '../../../model/ride_pref/ride_pref.dart';
import '../../../service/ride_prefs_filter_service.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/bla_icon_button.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefFilter extends StatefulWidget {
  final RidePreference currentPreference;

  const RidePrefFilter({super.key, required this.currentPreference});

  @override
  State<RidePrefFilter> createState() => _RidePrefFilterState();
}

class _RidePrefFilterState extends State<RidePrefFilter> {
  // Initialize state from the service
  late bool _isPetsAllowed;
  late SortOption _selectedSortOption;

  @override
  void initState() {
    super.initState();
    // Get initial values from FilterService
    _isPetsAllowed = FilterService.instance.isPetsAllowed;
    _selectedSortOption = FilterService.instance.sortOption;
  }

  void onBackSelected() {
    // Update service before closing the screen
    _updateFilterService();
    Navigator.of(context).pop();
  }

  void onSubmit() {
    // Update service before closing the screen
    _updateFilterService();
    Navigator.of(context).pop();
  }

  void _updateFilterService() {
    FilterService.instance.setCurrentFilter(_isPetsAllowed, _selectedSortOption);
  }

  void onClearAll() {
    setState(() {
      _isPetsAllowed = false;
      _selectedSortOption = SortOption.earliest_departure;
    });

    // Update service when filter is cleared
    _updateFilterService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            Row(
              children: [
                BlaIconButton(onPressed: onBackSelected, icon: Icons.close),
                const Spacer(),
                TextButton(
                  onPressed: onClearAll,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    "Clear all",
                    style: TextStyle(color: BlaColors.primary),
                  ),
                ),
              ],
            ),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text(
              "Filter",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal),
            ),
            const SizedBox(height: BlaSpacings.l),
            // Form
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sort by",
                    style: BlaTextStyles.title.copyWith(
                      color: BlaColors.textNormal,
                    ),
                  ),
                  const SizedBox(height: BlaSpacings.s),
                  RadioListTile<SortOption>(
                    activeColor: BlaColors.primary,
                    title: Text("Earliest departure"),
                    value: SortOption.earliest_departure,
                    groupValue: _selectedSortOption,
                    onChanged: (SortOption? value) {
                      if (value != null) {
                        setState(() {
                          _selectedSortOption = value;
                        });
                      }
                    },
                    secondary: Icon(
                      Icons.access_time,
                      color: BlaColors.textLight,
                    ),
                  ),
                  RadioListTile<SortOption>(
                    activeColor: BlaColors.primary,
                    title: Text("Lowest price"),
                    value: SortOption.price,
                    groupValue: _selectedSortOption,
                    onChanged: (SortOption? value) {
                      if (value != null) {
                        setState(() {
                          _selectedSortOption = value;
                        });
                      }
                    },
                    secondary: Icon(
                      Icons.attach_money,
                      color: BlaColors.textLight,
                    ),
                  ),
                  const SizedBox(height: BlaSpacings.l),
                  // line
                  Container(height: 5, color: BlaColors.backgroundAccent),
                  const SizedBox(height: BlaSpacings.l),
                  Text("Details", style: BlaTextStyles.title),
                  const SizedBox(height: BlaSpacings.s),
                  CheckboxListTile(
                    activeColor: BlaColors.primary,
                    title: Text("Pets allowed"),
                    value: _isPetsAllowed,
                    onChanged: (bool? value) {
                      setState(() {
                        _isPetsAllowed = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: BlaSpacings.l),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 160, // Set to your desired width
                          child: BlaButton(
                            text: "See riders",
                            onPressed: onSubmit,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
