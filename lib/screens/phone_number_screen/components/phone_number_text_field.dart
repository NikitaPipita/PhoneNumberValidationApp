import 'package:flutter/material.dart';

class PhoneNumberTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '(201) 555-0123',
        helperText: 'Enter your phone number',
      ),
    );
  }
}
