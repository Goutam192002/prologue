import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/events.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:prologue/core/repositories/auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(AuthStateUnknown());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is InitAuth) {
      String result = await SmsAutoFill().hint;
      yield UnAuthenticated(result, AuthStatus.DONE);
    } else if (event is Authenticate) {
      yield state.copyWith(authStatus: AuthStatus.LOADING);
      await _authRepository.authenticate(event.mobileNumber);
      yield WaitingForVerification(
        state.mobileNumber,
        AuthStatus.DONE,
      );
    } else if (event is VerifyMobileNumber) {
      yield state.copyWith(authStatus: AuthStatus.LOADING);
      try {
        var response =
            await _authRepository.verifyCode(event.mobileNumber, event.code);
        yield Authenticated();
      } catch (e) {
        yield state.copyWith(
          authStatus: AuthStatus.ERROR,
          error: 'Something went wrong please try again later',
        );
      }
    } else {
      throw UnimplementedError();
    }
  }
}
