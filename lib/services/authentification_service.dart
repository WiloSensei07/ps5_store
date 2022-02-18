import 'package:app_galery/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class AuthenticationService with ReactiveServiceMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthenticationService() {
    // listenToReactiveValues();
  }

  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  String getCurrentUID() {
    String uid = '';
    if (_firebaseAuth.currentUser != null) {
      uid = _firebaseAuth.currentUser!.uid;
    }
    return uid;
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        displaySnackbarError(context, "Utilisateur non trouvé");
        print('User Not Found');
      } else if (e.code == 'wrong-password') {
        displaySnackbarError(context, "Mot de passe incorrect");
        print('Wrong Password');
      }

      print(e.toString());
      return null;
    }
  }

  Future<AppUser> getAppUserFromFirestore() async {
    final userData =
        await _firestore.collection('users').doc(getCurrentUID()).get();
    final appUser = AppUser.fromFirestore(userData.data()!);
    _appUser = appUser;
    return appUser;
  }

  Future logout() async {
    await _firebaseAuth.signOut();
  }

  Future registerWithEmailAndPassword(String email, String password,
      String favoriteAnimal, BuildContext context) async {
    try {
      final userCreds = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCreds.user != null) {
        await _firestore.collection('users').doc(userCreds.user!.uid).set({
          'favoriteAnimal': favoriteAnimal,
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        displaySnackbarError(context, "Email déjà utilisé");
        print('Email already in use');
      } else if (e.code == 'weak-password') {
        displaySnackbarError(context, "Mot de passe trop faible");
        print('Weak Password');
      }
      return null;
    }
  }

  displaySnackbarError(BuildContext context, String displayedError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text(displayedError, style: const TextStyle(color: Colors.red))),
    );
  }
}
