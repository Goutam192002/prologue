import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/events.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateUnknown('+91'));

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is InitAuth) {
      String result = await SmsAutoFill().hint;
      String countryCode = result.substring(0, result.length - 10);
      String mobileNumber = result.substring(result.length - 10);
      yield UnAuthenticated(countryCode, mobileNumber);
    } else {
      throw UnimplementedError();
    }
  }
}
