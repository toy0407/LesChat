import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/domain/entities/user.dart';
import 'package:leschat/presentation/blocs/cubit/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  bool registerButton = true;

  @override
  void initState() {
    super.initState();
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, authState) {
            if (authState is RegisterSuccess) {
              registerButton = true;
            }
            if (authState is RegisterLoading) {
              registerButton = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Loading')));
            }
            if (authState is RegisterFailure) {
              registerButton = true;
            }
          },
          child: _body(),
        ));
  }

  _body() {
    return Padding(
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
                Text('Register to get started', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 140),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameTextEditingController,
                          validator: (name) => nameValidator(name),
                          decoration:
                              const InputDecoration(hintText: 'Enter name'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailTextEditingController,
                          validator: (email) => emailvalidator(email),
                          decoration: const InputDecoration(
                              hintText: 'Enter your email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordTextEditingController,
                          validator: (password) => passwordValidator(password),
                          decoration: const InputDecoration(
                              hintText: 'Enter your password'),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: confirmPasswordTextEditingController,
                          validator: (password) => passwordValidator(password),
                          decoration: const InputDecoration(
                              hintText: 'Confirm password'),
                          obscureText: true,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return registerButton
                        ? ElevatedButton(
                            onPressed: () {
                              if (_registerFormKey.currentState!.validate()) {
                                String name = nameTextEditingController.text;
                                String email = emailTextEditingController.text;
                                String password =
                                    passwordTextEditingController.text;

                                if (password.compareTo(
                                        confirmPasswordTextEditingController
                                            .text) ==
                                    0) {
                                  User user = User(
                                      name: name,
                                      email: email,
                                      password: password);
                                  BlocProvider.of<AuthCubit>(context)
                                      .signUp(user);
                                }
                              }
                            },
                            child: const Text('Register'),
                          )
                        : const CircularProgressIndicator();
                  },
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
    );
  }

  nameValidator(String? name) {
    if (name!.isEmpty) return 'Enter your name';
    //TODO: Name regex not working
    final bool nameValid =
        RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(name);
    return nameValid ? null : 'Enter valid name';
  }

  emailvalidator(String? email) {
    if (email!.isEmpty) return 'Please enter email';
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid ? null : 'Invalid Email';
  }

  passwordValidator(String? password) {
    if (password!.isEmpty) return 'Please enter password';
    // final bool passwordValid =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    //         .hasMatch(password);
    // return passwordValid ? null : 'Invalid Password';
    //TODO: Remove false validation
    return null;
  }
}
