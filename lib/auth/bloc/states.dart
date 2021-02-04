abstract class AuthState {
  final String mobileNumber;
  final String countryCode;
  AuthState(this.countryCode, this.mobileNumber);
}

class AuthStateUnknown extends AuthState {
  AuthStateUnknown(String countryCode) : super(countryCode, '');
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(String countryCode, String mobileNumber)
      : super(countryCode, mobileNumber);
}
