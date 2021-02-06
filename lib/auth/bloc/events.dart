abstract class AuthEvent {}

class InitAuth extends AuthEvent {}

class Authenticate extends AuthEvent {
  String mobileNumber;
  Authenticate(this.mobileNumber);
}

class VerifyMobileNumber extends AuthEvent {
  String mobileNumber;
  String code;

  VerifyMobileNumber({this.mobileNumber, this.code});
}
