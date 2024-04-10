import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/navigation.dart';
import 'auth.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigationMenu();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
