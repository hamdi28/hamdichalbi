import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_flutter_t4ulabs/views/mainscreen/mainscreen.dart';

class SignUPInCtr extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  var secure = true.obs;
  var cheked = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(
        vsync: this,
        length: 2,
        animationDuration: const Duration(milliseconds: 2000));
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }

  switching() {
    secure.value = !secure.value;
    update();
    return secure.value;
  }

  tearms(bool value) {
    cheked.value = value;
    update();
    return cheked.value;
  }

  googlesginin({
    required BuildContext context,
  }) async {
    try {
      // Trigger the authentication flow
      print('pos');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        try {
          FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get()
              .then((docsnapshot) async {
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(googleUser!.id.toString())
                .set({
              'ID': googleUser.id.toString(),
              'email': googleUser.email,
              'name': googleUser.displayName
            }).then((value) {});
          });
        } catch (e) {
          print(e);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  signin({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        Get.offAll(const MainScreeen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'Usernot exist').show();
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong Password').show();
      }
    }
  }
}
