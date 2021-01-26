import 'package:flutter/material.dart';

import 'phone_number_alert_dialog.dart';
import '../../../blocs/phone_number_screen_blocs/phone_number_screen_fab_bloc.dart';

class PhoneNumberScreenFab extends StatelessWidget {
  final _phoneNumberScreenFabBloc = PhoneNumberScreenFabBloc();

  final _activeColor = Colors.blue;
  final _disableColor = Colors.grey[350];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhoneNumberState>(
      stream: _phoneNumberScreenFabBloc.getFabColor,
      builder: (buildContext, snapshot) {
        if (snapshot.hasData) {
          return FloatingActionButton(
            child: Icon(
                Icons.arrow_forward
            ),
            backgroundColor:
                snapshot.data.disable ? _disableColor : _activeColor,
            onPressed: snapshot.data.disable
                ? null
                : () {
                    _phoneAlertDialog(context, snapshot.data.phoneNumber);
                  },
          );
        }
        return Container();
      },
    );
  }

  _phoneAlertDialog(BuildContext context, String phoneNumber) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return PhoneNumberAlertDialog(phoneNumber);
      },
    );
  }
}
