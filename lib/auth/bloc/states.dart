enum AuthStatus { LOADING, DONE }

abstract class AuthState {
  final String mobileNumber;
  final AuthStatus authStatus;

  AuthState(this.mobileNumber, this.authStatus);

  AuthState copyWith({mobileNumber, authStatus});
}

class AuthStateUnknown extends AuthState {
  AuthStateUnknown() : super('', AuthStatus.DONE);

  @override
  AuthState copyWith({mobileNumber, authStatus}) {
    return AuthStateUnknown();
  }
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(String mobileNumber, AuthStatus status)
      : super(mobileNumber, status);

  @override
  AuthState copyWith({mobileNumber, authStatus}) {
    return UnAuthenticated(
      mobileNumber ?? this.mobileNumber,
      authStatus ?? this.authStatus,
    );
  }
}

class WaitingForVerification extends AuthState {
  WaitingForVerification(String mobileNumber, AuthStatus authStatus)
      : super(mobileNumber, authStatus);

  @override
  AuthState copyWith({countryCode, mobileNumber, authStatus}) {
    return WaitingForVerification(
      mobileNumber ?? this.mobileNumber,
      authStatus ?? this.authStatus,
    );
  }
}
