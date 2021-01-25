import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'blocs/phone_number_screen_blocs/phone_field_bloc.dart';
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
    return BlocProvider(
      child: MaterialApp(
        title: 'PhoneNumberValidation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PhonePage(),
      ),

      blocs: [
        Bloc((i) => PhoneFieldBloc()),
      ],
    );
  }
}