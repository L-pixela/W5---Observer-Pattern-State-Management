import 'package:flutter/material.dart';

import '../../../model/ride_pref/ride_pref.dart';
import '../../../service/ride_prefs_service.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/bla_icon_button.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  RidePrefModal({super.key, required this.currentPreference
      // TODO 7 : We should pass the current prefs to this modal;
      });
  RidePreference currentPreference;

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void onSubmit(RidePreference newPreference) {
    // TODO 9 : We should pop this modal, with the new current preference
    setState(() {
      widget.currentPreference = newPreference;
    });

    Navigator.pop(context, newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back icon
          BlaIconButton(
            onPressed: onBackSelected,
            icon: Icons.close,
          ),
          SizedBox(height: BlaSpacings.m),

          // Title
          Text("Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal)),

          // Form
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: RidePrefForm(
              initialPreference: RidePrefService.instance
                  .currentPreference, // TODO 7 : The form should be displayed with the modal current prefs
              onSubmit: onSubmit,
            ),
          )),
        ],
      ),
    ));
  }
}
