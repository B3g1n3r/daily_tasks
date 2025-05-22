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
      notifyListeners();
    } catch (e) {
      print('register error: $e');
    }
  } 

  Future<void> login(String email, String password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      print('sucess');
    } catch (e) {
      print('login error: $e');
    }
  }
  Future<void> logout() async{
    try {
      await auth.signOut();
      notifyListeners();
      print('logout success');
    } catch (e) {
      print('error logout : $e');
    }
  }

}