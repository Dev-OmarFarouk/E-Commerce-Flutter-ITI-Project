import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../feature/Login/Login.dart';
import '../../resources/snack_bar.dart';

Future<void> logout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,

        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    }
  } on FirebaseAuthException catch (e) {
    if (context.mounted) {
      showMySnackBar(
        msg: e.message ?? "Error Occurred",
        type: AnimatedSnackBarType.error,
        context: context,
      );
    }
  } catch (e) {
    if (context.mounted) {
      showMySnackBar(
        msg:"Error Occurred",
        type: AnimatedSnackBarType.error,
        context: context,
      );
    }
  }
}
