import 'package:flutter/material.dart';

class PhoneNumberAlertDialog extends StatelessWidget {
  final phoneNumber;

  PhoneNumberAlertDialog(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    final okButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    return AlertDialog(
      title: Text(phoneNumber),
      actions: [
        okButton,
      ],
    );
  }
}
