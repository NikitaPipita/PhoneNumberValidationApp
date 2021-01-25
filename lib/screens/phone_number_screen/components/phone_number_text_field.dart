import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'clear_phone_field_button.dart';
import '../../../blocs/phone_number_screen_blocs/phone_field_bloc.dart';

class PhoneNumberTextField extends StatelessWidget {
  final _phoneFieldBloc = BlocProvider.getBloc<PhoneFieldBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _phoneFieldBloc.getPhoneNumber,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return TextField(
            controller: _phoneFieldBloc.getPhoneController,
            onChanged: (value) {
              _phoneFieldBloc.setPhoneNumber(value);
            },
            keyboardType: TextInputType.phone,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: '(201) 555-0123',
                helperText: 'Enter your phone number',
                suffixIcon: ClearPhoneFieldButton(),
            ),
            inputFormatters: [
              MaskedInputFormater(
                  '(000) 000-0000', anyCharMatcher: RegExp('[0-9]')),
            ],
          );
        }
        return Container();
      },
    );
  }
}
