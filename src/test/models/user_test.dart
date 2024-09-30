
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_modular_app/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should be instantiated with correct email and password', () {
			final user = User(email: 'test@example.com', password: 'password123');

			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('User model should serialize to JSON correctly', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final json = user.toJson();

			expect(json, {
				'email': 'test@example.com',
				'password': 'password123',
			});
		});

		test('User model should deserialize from JSON correctly', () {
			final json = {
				'email': 'test@example.com',
				'password': 'password123',
			};
			final user = User.fromJson(json);

			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
