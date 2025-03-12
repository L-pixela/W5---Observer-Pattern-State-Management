import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import 'filter_bar.dart';

///
/// Class for the FilterModal
///
class FilterModal extends StatefulWidget {
  final bool initialPetsAccepted;
  final String? initialSort;
  final Function(bool, String?) onApply;
  const FilterModal({
    super.key,
    required this.initialPetsAccepted,
    required this.initialSort,
    required this.onApply,
  });

  // When we call the FilterModal we can use the show, and it will return the modal
  static Future<void> show({
    required BuildContext context,
    required bool initialPetsAccepted,
    required String? initialSort,
    required Function(bool, String?) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FilterModal(
        initialPetsAccepted: initialPetsAccepted,
        initialSort: initialSort,
        onApply: onApply,
      ),
    );
  }

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late bool _petsAccepted;
  late String? _selectedSort;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _petsAccepted = widget.initialPetsAccepted;
    _selectedSort = widget.initialSort;
  }

  void onPressedBackFromFilter() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Bar of the modal
          Padding(
            padding: EdgeInsets.fromLTRB(
                BlaSpacings.s, BlaSpacings.m, BlaSpacings.m, BlaSpacings.l),
            child: FilterBar(
              onPressedBack: onPressedBackFromFilter,
              onPressedResetFilter: () {},
            ),
          ),

          // Filter Content Where we can see the filter
          // In Progress, title can call from the from the RideSort enum in RidesService
          // RadioListTile<String>(
          //     title: "",
          //     value: value,
          //     groupValue: groupValue,
          //     onChanged: onChanged),
          // RadioListTile<String>(
          //     value: value, groupValue: groupValue, onChanged: onChanged)
        ],
      ),
    );
  }
}
