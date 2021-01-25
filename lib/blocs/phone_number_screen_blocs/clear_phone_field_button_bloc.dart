import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import 'phone_field_bloc.dart';

class ClearPhoneFieldButtonBloc extends BlocBase{
  final _phoneFieldBloc = BlocProvider.getBloc<PhoneFieldBloc>();
  StreamSubscription _phoneFieldBlocSubscription;

  final _clearPhoneFieldButtonVisibility = BehaviorSubject<bool>();

  Stream<bool> get getButtonVisibility =>
      _clearPhoneFieldButtonVisibility.stream;

  ClearPhoneFieldButtonBloc() {
    _clearPhoneFieldButtonVisibility.sink.add(false);

    _phoneFieldBlocSubscription =
        _phoneFieldBloc.getPhoneNumber.listen((event) {
      if (event.isNotEmpty) {
        _clearPhoneFieldButtonVisibility.sink.add(true);
      }
    });
  }

  void clearPhoneField() => _phoneFieldBloc.clearPhoneField();

  @override
  void dispose() {
    super.dispose();
    _phoneFieldBlocSubscription.cancel();
    _clearPhoneFieldButtonVisibility.close();
  }
}