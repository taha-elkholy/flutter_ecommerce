import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            e.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 48.0,
              horizontal: 24.0,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.authType == AuthType.login ? 'Login' : 'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      textInputAction: TextInputAction.next,
                      onChanged: model.updateEmail,
                      validator: (val) =>
                          val!.isEmpty ? 'Please Enter Your Email' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onChanged: model.updatePassword,
                      validator: (val) =>
                          val!.isEmpty ? 'Please Enter Your Password' : null,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    if (model.authType == AuthType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: const Text('Forgot Your Password?'),
                          onTap: () {},
                        ),
                      ),
                    const SizedBox(height: 24.0),
                    MainButton(
                        text: model.authType == AuthType.login
                            ? 'Login'
                            : 'Register',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _submit(model);
                          }
                        }),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(model.authType == AuthType.login
                            ? 'Don\'t have an account? Register'
                            : 'Already have an account? Login'),
                        onTap: () {
                          _formKey.currentState!.reset();
                          model.toggleLoginAndRegister();
                        },
                      ),
                    ),
                    //const Spacer(),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authType == AuthType.login
                              ? 'Or Login With'
                              : 'Or Register With',
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
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
                          width: 70.0,
                          height: 70.0,
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
            ),
          )),
        );
      },
    );
  }
}
