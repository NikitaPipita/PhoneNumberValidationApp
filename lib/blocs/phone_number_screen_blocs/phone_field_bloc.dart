import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PhoneFieldBloc extends BlocBase{

  final _phoneNumber = BehaviorSubject<String>();

  final TextEditingController _phoneController = TextEditingController();

  Function(String) get setPhoneNumber => _phoneNumber.sink.add;
  Stream<String> get getPhoneNumber => _phoneNumber.stream;

  TextEditingController get getPhoneController => _phoneController;

  void clearPhoneField() {
    _phoneNumber.sink.add('');
    _phoneController.clear();
  }

  PhoneFieldBloc() {
    _phoneNumber.sink.add('');
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumber.close();
    _phoneController.dispose();
  }
}