import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign in with..' + user.email! ),
            sizedBox(0, 10),
            // Text('Sign in as..' + user.displayName!),

            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.pushNamed(context, loginRoute));
                },
                child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
