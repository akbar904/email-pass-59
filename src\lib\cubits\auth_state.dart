
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();
}

class Authenticated extends AuthState {
	const Authenticated();
}

class Unauthenticated extends AuthState {
	const Unauthenticated();
}
