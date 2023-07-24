import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

signup(String email, password, username, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userCredential.user!.uid)
        .set({'username': username, 'email': email});
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Signup Successfully')));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Password is too weak.')));
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email already exist.')));
    }
  } catch (e) {
    print(e);
  }
}

signin(String email, password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Signin Successfully')));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email')));
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Wrong password')));
    }
  }
}
