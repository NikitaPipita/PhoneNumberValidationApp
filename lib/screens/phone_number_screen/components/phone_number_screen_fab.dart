import 'package:flutter/material.dart';

import '../../../blocs/phone_number_screen_blocs/phone_number_screen_fab_bloc.dart';

class PhoneNumberScreenFab extends StatelessWidget {
  final _phoneNumberScreenFabBloc = PhoneNumberScreenFabBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _phoneNumberScreenFabBloc.getFabColor,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FloatingActionButton(
            child: Icon(
                Icons.arrow_forward
            ),
            backgroundColor: snapshot.data,
            onPressed: null,
          );
        }
        return Container();
      },
    );
  }
}
