import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void Initializing() async {
  await Firebase.initializeApp();
}

void stateFirebase(context, routeName) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      Navigator.pushNamed(context, routeName);
    }
  });
}

void singIn({@required email, @required password}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      //PimAlertDialogMsgBox(title:'Paila', message:'No user found for that email.', onPressed: (){
      //  Navigator.of(context).pop();
      //},
      //);
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void signUp({@required email, @required password, context, routeName}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void signOut(context, routeName) async {
  await FirebaseAuth.instance.signOut();

  Navigator.pushNamed(context, routeName);
}
