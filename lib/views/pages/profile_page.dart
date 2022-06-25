import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) => Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: MainButton(
              text: 'Logout',
              onTap: () {
                model.signOut();
              }),
        ),
      ),
    );
  }
}
