
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_modular_app/widgets/login_form.dart';
import 'package:com.example.flutter_modular_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('should display email and password fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: authCubit,
					child: MaterialApp(home: Scaffold(body: LoginForm())),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('should call login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			final emailField = find.byKey(Key('emailField'));
			final passwordField = find.byKey(Key('passwordField'));
			final loginButton = find.byType(ElevatedButton);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: authCubit,
					child: MaterialApp(home: Scaffold(body: LoginForm())),
				),
			);

			await tester.enterText(emailField, 'test@example.com');
			await tester.enterText(passwordField, 'password123');
			await tester.tap(loginButton);

			verify(() => authCubit.login('test@example.com', 'password123')).called(1);
		});
	});

	group('AuthCubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emit [Authenticated] when login is called with correct email and password',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<AuthCubit, AuthState>(
			'emit [Unauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
