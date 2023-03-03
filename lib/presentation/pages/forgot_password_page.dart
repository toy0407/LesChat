import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leschat/presentation/blocs/cubit/auth_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailTextEditingController;
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
        ),
        centerTitle: false,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Enter Your Email',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          Form(
            key: _forgotPasswordFormKey,
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => _emailValidator(value),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                if (_forgotPasswordFormKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context)
                      .forgotPassword(_emailTextEditingController.text);
                }
              },
              child: const Text('Find Your Account'))
        ],
      ),
    );
  }

  _emailValidator(String? email) {
    if (email!.isEmpty) return 'Please enter email';
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid ? null : 'Invalid Email';
  }
}
