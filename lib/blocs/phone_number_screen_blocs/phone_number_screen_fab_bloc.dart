import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'phone_field_bloc.dart';
import '../../utils/extensions/string_extensions.dart';

class PhoneNumberScreenFabBloc extends BlocBase{
  final _phoneFieldBloc = BlocProvider.getBloc<PhoneFieldBloc>();
  StreamSubscription _phoneFieldBlocSubscription;

  final _activeColor = Colors.blue;
  final _disableColor = Colors.grey[350];

  final _fabColor = BehaviorSubject<Color>();

  Stream<Color> get getFabColor => _fabColor.stream;


  PhoneNumberScreenFabBloc() {
    _fabColor.sink.add(_disableColor);

    _phoneFieldBlocSubscription =
        _phoneFieldBloc.getPhoneNumber.listen((event) {
          if (event.validatePhoneNumber()) {
            _fabColor.sink.add(_activeColor);
          } else {
            _fabColor.sink.add(_disableColor);
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneFieldBlocSubscription.cancel();
    _fabColor.close();
  }
}