
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_modular_app/screens/home_screen.dart';
import 'package:com.example.flutter_modular_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('should display LogoutButton', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: authCubit,
					child: HomeScreen(),
				),
			);

			expect(find.byType(LogoutButton), findsOneWidget);
		});

		testWidgets('should display "Home Screen" text', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: authCubit,
					child: HomeScreen(),
				),
			);

			expect(find.text('Home Screen'), findsOneWidget);
		});

		testWidgets('should call logout when LogoutButton is pressed', (WidgetTester tester) async {
			when(() => authCubit.logout()).thenReturn(null);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>.value(
					value: authCubit,
					child: HomeScreen(),
				),
			);

			await tester.tap(find.byType(LogoutButton));
			await tester.pump();

			verify(() => authCubit.logout()).called(1);
		});
	});
}
