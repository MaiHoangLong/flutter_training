import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Logout")),
          ),
        ]),
      ),
    );
  }
}
