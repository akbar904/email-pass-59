
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		emit(AuthLoading());
		// Simulating network delay
		await Future.delayed(Duration(seconds: 1));
		// Simple logic for demonstration purposes
		if (email == 'test@example.com' && password == 'password') {
			emit(AuthAuthenticated());
		} else {
			emit(AuthUnauthenticated());
		}
	}

	void logout() async {
		emit(AuthUnauthenticated());
	}
}
