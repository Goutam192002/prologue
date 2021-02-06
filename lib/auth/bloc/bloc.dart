import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/events.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateUnknown());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is InitAuth) {
      String result = await SmsAutoFill().hint;
      yield UnAuthenticated(result, AuthStatus.DONE);
    } else if (event is Authenticate) {
      yield state.copyWith(authStatus: AuthStatus.LOADING);
      yield WaitingForVerification(
        state.mobileNumber,
        AuthStatus.DONE,
      );
    } else {
      throw UnimplementedError();
    }
  }
}
