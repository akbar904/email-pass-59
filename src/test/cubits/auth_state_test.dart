
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_modular_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements Cubit<AuthState> {}

void main() {
	group('AuthState', () {
		group('initial', () {
			test('supports value equality', () {
				expect(AuthState.initial(), equals(AuthState.initial()));
			});
			
			test('props are correct', () {
				expect(AuthState.initial().props, []);
			});
		});
		
		group('authenticated', () {
			test('supports value equality', () {
				expect(AuthState.authenticated(), equals(AuthState.authenticated()));
			});
			
			test('props are correct', () {
				expect(AuthState.authenticated().props, []);
			});
		});
		
		group('unauthenticated', () {
			test('supports value equality', () {
				expect(AuthState.unauthenticated(), equals(AuthState.unauthenticated()));
			});
			
			test('props are correct', () {
				expect(AuthState.unauthenticated().props, []);
			});
		});
	});
}
