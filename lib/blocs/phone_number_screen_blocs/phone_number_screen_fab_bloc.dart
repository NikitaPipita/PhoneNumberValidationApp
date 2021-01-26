import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import 'phone_field_bloc.dart';
import '../../utils/extensions/string_extensions.dart';

class PhoneNumberScreenFabBloc extends BlocBase{
  final _phoneFieldBloc = BlocProvider.getBloc<PhoneFieldBloc>();
  StreamSubscription _phoneFieldBlocSubscription;

  final _fabColor = BehaviorSubject<PhoneNumberState>();

  Stream<PhoneNumberState> get getFabColor => _fabColor.stream;


  PhoneNumberScreenFabBloc() {
    _fabColor.sink.add(PhoneNumberState(disable: true));

    _phoneFieldBlocSubscription =
        _phoneFieldBloc.getPhoneNumber.listen((event) {
      if (event.validatePhoneNumber()) {
        var phone = event.parsePhoneNumber();
        _fabColor.sink
            .add(PhoneNumberState(disable: false, phoneNumber: phone));
      } else {
        _fabColor.sink.add(PhoneNumberState(disable: true));
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

class PhoneNumberState {
  final bool disable;
  final String phoneNumber;

  PhoneNumberState({
    this.disable,
    this.phoneNumber
  });
}