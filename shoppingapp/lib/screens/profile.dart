import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/auth/auth.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.to(() => const AuthPage());
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: const Column(
          children: [
            // Items of  profile page
            // Items of  profile page
          ],
        ));
  }
}
