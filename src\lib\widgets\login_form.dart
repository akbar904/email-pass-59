
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_modular_app/cubits/auth_cubit.dart';

class LoginForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final authCubit = context.read<AuthCubit>();

		final emailController = TextEditingController();
		final passwordController = TextEditingController();

		return Column(
			children: [
				TextField(
					key: Key('emailField'),
					controller: emailController,
					decoration: InputDecoration(labelText: 'Email'),
				),
				TextField(
					key: Key('passwordField'),
					controller: passwordController,
					decoration: InputDecoration(labelText: 'Password'),
					obscureText: true,
				),
				ElevatedButton(
					onPressed: () {
						final email = emailController.text;
						final password = passwordController.text;
						authCubit.login(email, password);
					},
					child: Text('Login'),
				),
			],
		);
	}
}
