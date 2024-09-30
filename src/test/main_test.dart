
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular_app/main.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App has MyApp widget', (WidgetTester tester) async {
			// Build the app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that MyApp widget is present.
			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('Initial screen is LoginScreen', (WidgetTester tester) async {
			// Build the app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that the initial screen is LoginScreen by looking for text or widget specific to LoginScreen.
			expect(find.text('Login'), findsOneWidget);
		});
	});
}
