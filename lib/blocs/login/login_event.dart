part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginCorreoEvent extends LoginEvent {
  final String correo;
  const LoginCorreoEvent(this.correo);
}

class LoginPasswordEvent extends LoginEvent {
  final String password;
  const LoginPasswordEvent(this.password);
}

class LoginErrorCorreoEvent extends LoginEvent {
  final String errorCorreo;
  const LoginErrorCorreoEvent(this.errorCorreo);
}

class LoginErrorPasswordEvent extends LoginEvent {
  final String errorPassword;
  const LoginErrorPasswordEvent(this.errorPassword);
}

class LoginValidarCorreoEvent extends LoginEvent {
  const LoginValidarCorreoEvent();
}

class LoginValidarPasswordEvent extends LoginEvent {
  const LoginValidarPasswordEvent();
}

class LoginMessageEvent extends LoginEvent {
  final String message;
  const LoginMessageEvent(this.message);
}
