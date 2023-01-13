import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome to Leschat', style: TextStyle(fontSize: 32)),
                  SizedBox(height: 10),
                  Text('Register to get started',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 180),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CupertinoTextField(
                    placeholder: 'Enter your email',
                  ),
                  const SizedBox(height: 10),
                  const CupertinoTextField(
                    placeholder: 'Enter your password',
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 60),
                  const Text('Already registered?'),
                  TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: const Text('Login'))
                ],
              ),
            ]),
      ),
    );
  }
}
