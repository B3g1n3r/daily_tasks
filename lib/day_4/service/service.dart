// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Service extends ChangeNotifier{
  
  final auth = FirebaseAuth.instance;
  User? get getUser => auth.currentUser;

  Service(){
    auth.authStateChanges().listen((user){
      notifyListeners();
    });
  }

  Future<void> register(String email, String password) async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
    }
  } 

  Future<void> login(String email, String password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
    }
  }
  Future<void> logout() async{
    try {
      await auth.signOut();
    } catch (e) {
    }
  }

}