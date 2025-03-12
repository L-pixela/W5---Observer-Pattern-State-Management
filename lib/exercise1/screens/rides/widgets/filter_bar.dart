import 'package:flutter/material.dart';

import '../../../widgets/actions/bla_text_button.dart';

class FilterBar extends StatelessWidget {
  final VoidCallback onPressedBack;
  final VoidCallback onPressedResetFilter;
  const FilterBar(
      {super.key,
      required this.onPressedBack,
      required this.onPressedResetFilter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1- Left Icon for Exiting
        IconButton(
          onPressed: onPressedBack,
          icon: Icon(Icons.close),
        ),

        // 2- Right Size for resetting the filter
        BlaTextButton(text: "Clear Filter", onPressed: onPressedResetFilter)
      ],
    );
  }
}
