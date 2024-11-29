import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/const.dart';
import 'package:product_order_app_task/data/local_preference.dart';
import 'package:product_order_app_task/modules/home/view/home_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign Up
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (!_validateName(name) ||
        !_validateEmail(email) ||
        !_validatePassword(password)) {
      return;
    }
    EasyLoading.show(status: "Loading....");
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user?.uid != null) {
        LocalPreferenceService.instance.setToken(token: user.user!.uid);
        LocalPreferenceService.instance.setEmail(email: user.user!.email!);
        Fluttertoast.showToast(msg: "Account created successfully!");

        /// Save user data to Firestore
        await firestore.collection('users').doc(user.user?.uid).set({
          'uid': user.user?.uid,
          'email': email,
          'username': name,
          'createdAt': DateTime.now().toIso8601String(),
        });
        Get.offAll(() => const HomeView());
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Sign-Up Failed");
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// Sign In
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    if (!_validateName(email) || !_validatePassword(password)) {
      return;
    }
    EasyLoading.show(status: "Loading....");
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user?.uid != null) {
        LocalPreferenceService.instance.setToken(token: user.user!.uid);
        LocalPreferenceService.instance.setEmail(email: user.user!.email!);
        Fluttertoast.showToast(msg: "Login Successful!");
        Get.offAll(() => const HomeView());
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Login Failed");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Fluttertoast.showToast(msg: "Logout Successfull");
    LocalPreferenceService.instance.removeToken();
    LocalPreferenceService.instance.removeEmail();
    Get.offAll(() => const HomeView());
  }

  /// Email Validation
  bool _validateEmail(String email) {
    if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Email is required");
      return false;
    } else if (!GetUtils.isEmail(email)) {
      Fluttertoast.showToast(msg: "Enter a valid email");
      return false;
    }
    return true;
  }

  /// Password Validation
  bool _validatePassword(String password) {
    if (password.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
      return false;
    } else if (password.length < 6) {
      Fluttertoast.showToast(msg: "Password must be at least 6 characters");
      return false;
    }
    return true;
  }

  /// Name Validation
  bool _validateName(String name) {
    if (name.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Name is required");
      return false;
    } else if (name.length < 3) {
      Fluttertoast.showToast(msg: "Username must be at least 3 characters");
      return false;
    }
    return true;
  }
}
