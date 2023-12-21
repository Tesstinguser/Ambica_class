import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'OtpScreen.dart';




class PhoneAuthScreen extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();
  String? phoneNumber;

  PhoneAuthScreen({super.key});

  void _signInWithPhone(BuildContext context) async {
    if (phoneNumber != null && phoneNumber!.isNotEmpty) {
      final FirebaseAuth auth = FirebaseAuth.instance;
      try {
        await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber!,
          verificationCompleted: (PhoneAuthCredential credential) {
            // Automatic verification completed (only on physical devices).
            // You can sign in the user here.
          },
          verificationFailed: (FirebaseAuthException e) {
            // Handle verification failed (e.g., invalid phone number).
          },
          codeSent: (String verificationId, int? resendToken) {
            // Save the verification ID and navigate to the OTP screen to enter the code.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto retrieval timeout.
          },
        );
      } catch (e) {
        // Handle exceptions.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IntlPhoneField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
            ),
            ElevatedButton(
              onPressed: () => _signInWithPhone(context),
              child: const Text('Verify Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}
