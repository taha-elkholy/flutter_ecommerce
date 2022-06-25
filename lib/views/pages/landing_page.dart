import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/services/auth.dart';
import 'package:flutter_ecommerce/views/pages/auth_page.dart';
import 'package:flutter_ecommerce/views/pages/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBase = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
        stream: authBase.authStateChanges(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.active:
              return ChangeNotifierProvider<AuthController>(
                create: (_) => AuthController(authBase: authBase),
                child: (snapshot.data == null)
                    ? const AuthPage()
                    : const BottomNavBar(),
              );
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }
          return const SizedBox();
        });
  }
}
