// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore myFirebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class DataBaseServices {
  static Future<void> addData(
      String title, String detail, String collecname) async {
    await myFirebaseFirestore.collection(collecname).add({
      "title": title,
      "detail": detail,
    }).whenComplete(() {
      print('Added Successfully');
    }).catchError((error, stackTrace) {
      print('Some Error Occured');
    });
  }
  //
  // Deleting Data from database
  //

  static Future<void> deleData(String id) async {
    await myFirebaseFirestore
        .collection('notes')
        .doc(id)
        .delete()
        .whenComplete(() => print('Deleted Successfull'))
        .onError((error, stackTrace) => print('Donot Deleted'));
  }
  //
  //  sign up user
  //

  static Future<void> signUp(String email, String password) async {
    UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => print('SignUp Successful'));
  }

  //
  //   Sign In User
  //

  static Future<void> loginUser(String email, String password) async {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => print('Sign in successfully'));
  }

  //
  //  forgot password
  //

  static Future<void> forgotPassword(String email) async {
    auth.sendPasswordResetEmail(email: email);
  }
}
