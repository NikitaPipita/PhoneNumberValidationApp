import 'package:flutter/material.dart';

import '../../../blocs/phone_number_screen_blocs/clear_phone_field_button_bloc.dart';

class ClearPhoneFieldButton extends StatelessWidget {
  final _clearPhoneFieldButtonBloc = ClearPhoneFieldButtonBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _clearPhoneFieldButtonBloc.getButtonVisibility,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Visibility(
            visible: snapshot.data,
            child: IconButton(
              splashRadius: 24.0,
              icon: Icon(
                Icons.cancel,
                size: 20.0,
                color: Colors.grey,
              ),
              onPressed: () {
                _clearPhoneFieldButtonBloc.clearPhoneField();
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
