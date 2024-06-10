import 'package:flutter/material.dart';
import 'package:tokoto/util/token.dart';
import 'package:tokoto/view/login_view.dart';

import '../model/user.dart';
import '../service/user_service.dart';
import 'my_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserService().getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyProfileView();
          } else if (token == null) {
            return LoginView();
          } else if (snapshot.hasError) {
            return LoginView();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
