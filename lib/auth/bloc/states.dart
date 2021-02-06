enum AuthStatus { LOADING, DONE }

abstract class AuthState {
  final String mobileNumber;
  final String countryCode;
  final AuthStatus authStatus;

  AuthState(this.countryCode, this.mobileNumber, this.authStatus);

  AuthState copyWith({countryCode, mobileNumber, authStatus});
}

class AuthStateUnknown extends AuthState {
  AuthStateUnknown(String countryCode)
      : super(countryCode, '', AuthStatus.DONE);

  @override
  AuthState copyWith({countryCode, mobileNumber, authStatus}) {
    return AuthStateUnknown(countryCode ?? this.countryCode);
  }
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(String countryCode, String mobileNumber, AuthStatus status)
      : super(countryCode, mobileNumber, status);

  @override
  AuthState copyWith({countryCode, mobileNumber, authStatus}) {
    return UnAuthenticated(
      countryCode ?? this.countryCode,
      mobileNumber ?? this.mobileNumber,
      authStatus ?? this.authStatus,
    );
  }
}
