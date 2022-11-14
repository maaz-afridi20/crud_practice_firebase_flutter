import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailPageAuthChecking extends StatelessWidget {
  EmailPageAuthChecking({Key? key}) : super(key: key);

  TextEditingController emailc = TextEditingController();
  TextEditingController passc = TextEditingController();

  final formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  createUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('Something happende');
    }
  }

  loginUser(String email, String password) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Auth'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter email';
                  }
                  return null;
                },
                controller: emailc,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: passc,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await loginUser(emailc.text, passc.text);
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await createUser(emailc.text, passc.text);
                  }
                },
                child: const Text('Already have an account/ signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
