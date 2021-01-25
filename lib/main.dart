import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/phone_number_screen/phone_number_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]
  ).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoneNumberValidation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhonePage(),
    );
  }
}