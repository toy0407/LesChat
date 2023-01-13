import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  Text('Please login to continue',
                      style: TextStyle(fontSize: 18)),
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
                  TextButton(
                    child: const Text('Forgot Password?'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      return context.go('/chats');
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 30),
                  const Text('Don\'t have an account?'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/images/google.svg')),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/images/apple.svg')),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/images/facebook.svg')),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {
                            context.push('/register');
                          },
                          icon: SvgPicture.asset('assets/images/email.svg')),
                    ],
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
