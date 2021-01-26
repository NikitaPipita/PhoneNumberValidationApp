import 'package:flutter/material.dart';

import 'components/phone_number_screen_fab.dart';
import 'components/phone_number_text_field.dart';

class PhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Text(
            'Get Started',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: PhoneNumberTextField(),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
      floatingActionButton: PhoneNumberScreenFab(),
    );
  }
}
