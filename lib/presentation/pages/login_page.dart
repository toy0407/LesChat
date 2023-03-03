import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:leschat/domain/entities/user.dart';
import 'package:leschat/presentation/blocs/cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  final GlobalKey<FormState> _signInFormKey = GlobalKey();
  bool loginButton = true;

  @override
  void initState() {
    super.initState();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, authState) {
          if (authState is LoginSuccess) {
            loginButton = true;
            context.go('/home');
          }
          if (authState is LoginLoading) {
            loginButton = false;
          }
          if (authState is LoginFailure) {
            loginButton = true;
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Login Failed')));
          }
        },
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Welcome to Leschat',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text('Please login to continue',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 180),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _signInFormKey,
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value),
                      controller: emailTextEditingController,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                      controller: passwordTextEditingController,
                      validator: (value) => passwordValidator(value),
                      obscureText: true,
                    ),
                  ]),
                ),
                TextButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {
                    context.push('/forgotPassword');
                  },
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                    return loginButton
                        ? ElevatedButton(
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                String email = emailTextEditingController.text;
                                String password =
                                    passwordTextEditingController.text;
                                User user =
                                    User(email: email, password: password);
                                BlocProvider.of<AuthCubit>(context)
                                    .signIn(user);
                              }
                            },
                            child: const Text('Login'))
                        : const CircularProgressIndicator();
                  },
                ),
                const SizedBox(height: 30),
                const Text('Don\'t have an account?'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/google.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/apple.svg',
                          width: 30,
                          height: 30,
                        )),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/facebook.svg',
                          width: 30,
                          height: 30,
                        )),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {
                          context.push(
                            '/register',
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/images/email.svg',
                          width: 30,
                          height: 30,
                        )),
                  ],
                ),
              ],
            ),
          ]),
    );
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) return 'Please enter email';
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid ? null : 'Invalid Email';
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) return 'Please enter password';
    // final bool passwordValid =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    //         .hasMatch(password);
    // return passwordValid ? null : 'Invalid Password';
    //TODO: Remove false validation
    return null;
  }
}
