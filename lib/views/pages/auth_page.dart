import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var _authType = AuthType.login;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 46.0,
          horizontal: 32.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _authType == AuthType.login ? 'Login' : 'Register',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 64.0),
              TextFormField(
                controller: _emailController,
                validator: (val) =>
                    val!.isEmpty ? 'Please Enter Your Email' : null,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _passwordController,
                validator: (val) =>
                    val!.isEmpty ? 'Please Enter Your Password' : null,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                ),
              ),
              const SizedBox(height: 16.0),
              if (_authType == AuthType.login)
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: const Text('Forgot Your Password?'),
                    onTap: () {},
                  ),
                ),
              const SizedBox(height: 24.0),
              MainButton(
                  text: _authType == AuthType.login ? 'Login' : 'Register',
                  onTap: () {}),
              const SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text(_authType == AuthType.login
                      ? 'Don\'t have an account? Register'
                      : 'Already have an account? Login'),
                  onTap: () {
                    setState(() {
                      if (_authType == AuthType.login) {
                        _authType = AuthType.register;
                      } else {
                        _authType = AuthType.login;
                      }
                    });
                  },
                ),
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    _authType == AuthType.login
                        ? 'Or Login With'
                        : 'Or Register With',
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
