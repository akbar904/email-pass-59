
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_modular_app/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Mock necessary dependencies
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);

			// Act
			final emailField = find.byType(TextFormField).first;
			final passwordField = find.byType(TextFormField).last;

			// Assert
			expect(emailField, findsOneWidget);
			expect(passwordField, findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);

			// Act
			final loginButton = find.byType(ElevatedButton);

			// Assert
			expect(loginButton, findsOneWidget);
		});
	});

	group('AuthCubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emit authenticated state on successful login',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [isA<AuthStateAuthenticated>()],
		);

		blocTest<AuthCubit, AuthState>(
			'emit unauthenticated state on logout',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [isA<AuthStateUnauthenticated>()],
		);
	});
}
