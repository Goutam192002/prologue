enum AuthStatus { LOADING, DONE, ERROR }

abstract class AuthState {
  final String mobileNumber;
  final AuthStatus authStatus;
  final String error;

  AuthState({this.mobileNumber, this.authStatus, this.error = ''});

  AuthState copyWith({mobileNumber, authStatus, error});
}

class AuthStateUnknown extends AuthState {
  AuthStateUnknown() : super(mobileNumber: '', authStatus: AuthStatus.DONE);

  @override
  AuthState copyWith({mobileNumber, authStatus, error}) {
    return AuthStateUnknown();
  }
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(String mobileNumber, AuthStatus status)
      : super(mobileNumber: mobileNumber, authStatus: status);

  @override
  AuthState copyWith({mobileNumber, authStatus, error}) {
    return UnAuthenticated(
      mobileNumber ?? this.mobileNumber,
      authStatus ?? this.authStatus,
    );
  }
}

class WaitingForVerification extends AuthState {
  WaitingForVerification(String mobileNumber, AuthStatus authStatus,
      {String error})
      : super(mobileNumber: mobileNumber, authStatus: authStatus, error: error);

  @override
  AuthState copyWith({countryCode, mobileNumber, authStatus, error}) {
    return WaitingForVerification(
      mobileNumber ?? this.mobileNumber,
      authStatus ?? this.authStatus,
      error: error ?? this.error,
    );
  }
}

class Authenticated extends AuthState {
  Authenticated() : super(mobileNumber: '', authStatus: AuthStatus.DONE);

  @override
  AuthState copyWith({mobileNumber, authStatus, error}) {
    return Authenticated();
  }
}
