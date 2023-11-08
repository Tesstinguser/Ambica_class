import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../LoginFiles/otp_verification.dart';
import 'OtpScreen.dart';
import 'home_page.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  String verifId = '';
  bool isSent = false;
  String? phoneNumber;

  void _signInWithPhone(BuildContext context) async {
    if (phoneNumber != null && phoneNumber!.isNotEmpty) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      try {
        await _auth.verifyPhoneNumber(
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
        title: const Text('My App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // IntlPhoneField(
            //   controller: userController,
            //   decoration: InputDecoration(
            //     labelText: 'Phone Number',
            //
            //   ),
            //   initialCountryCode: 'IN',
            //   onChanged: (phone) {
            //     phoneNumber = phone.completeNumber;
            //   },
            // ),
            // IntlPhoneField(
            //   controller: userController,
            //   decoration: InputDecoration(
            //     labelText: 'Phone Number',
            //    border: OutlineInputBorder(
            //       borderSide: BorderSide(),
            //
            //     ),
            //   ),
            //
            //   initialCountryCode: 'IN',
            //   onChanged: (phone) {
            //
            //     print(phone.completeNumber);
            //     print("Phonenumber==?$phone");
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(
                  labelText: 'Enter mobile number',
                ),
              ),
            ),
            // if (isSent)
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: TextField(
            //       controller: codeController,
            //       decoration: const InputDecoration(
            //         labelText: 'Enter code ',
            //       ),
            //     ),
            //   ),
            // Expanded(
            //   child: OtpTextField(
            //     numberOfFields: 6,
            //     borderColor: Color(0xFF512DA8),
            //     //set to true to show as box or false to show as dash
            //     showFieldAsBox: true,
            //     //runs when a code is typed in
            //     onCodeChanged: (String code) {
            //       //handle validation or checks here
            //     },
            //     //runs when every textfield is filled
            //     onSubmit: (String verificationCode){
            //       showDialog(
            //           context: context,
            //           builder: (context){
            //             return AlertDialog(
            //               title: Text("Verification Code"),
            //               content: Text('Code entered is $verificationCode'),
            //             );
            //           }
            //       );
            //     }, // end onSubmit
            //   ),
            // ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Expanded(
        //     child: OtpTextField(
        //       numberOfFields: 6,
        //       borderColor: Color(0xFF512DA8),
        //       //set to true to show as box or false to show as dash
        //       showFieldAsBox: true,
        //       //runs when a code is typed in
        //       onCodeChanged: (String code) {
        //         //handle validation or checks here
        //       },
        //       //runs when every textfield is filled
        //       onSubmit: (String verificationCode){
        //         showDialog(
        //             context: context,
        //             builder: (context){
        //               return AlertDialog(
        //                 title: Text("Verification Code"),
        //                 content: Text('Code entered is $verificationCode'),
        //               );
        //             }
        //         );
        //       }, // end onSubmit
        //     ),
        //   ),
        // ),
            ElevatedButton(
              onPressed: () {
                _signInWithPhone(context);
                  isSent
                      ? verifyUser()
                      : registerUser(userController.text, context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTPverification((userController.text),)));
              },
              child: Text(isSent ? 'Verify' : 'Send OTP'),
              // child: Text('Send otp'),
            ),
          ],
        ),
      ),
    );
  }

  Future registerUser(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential authCredential) {
          log('from verificationCompleted');
          _auth
              .signInWithCredential(authCredential)
              .then((UserCredential result) {
            log('from verificationCompleted done');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(result.user as UserCredential)));
          }).catchError((e) {
            log('from verificationCompleted error');
            print(e);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          log('from verificationFailed');
          if (e.phoneNumber == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
            Fluttertoast.showToast(msg: e.code);
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('from codeSent $verificationId');
          isSent = true;
          verifId = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log('from codeAutoRetrievalTimeout $verificationId');
          // Auto-resolution timed out...
        });
    print("MOBILESS++>>$mobile");
    print("MOBILESS++>>$verifId");
  }
  verifyUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    // Update the UI - wait for the user to enter the SMS code
    String smsCode = codeController.text.trim();

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: verifId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await _auth.signInWithCredential(credential).then((UserCredential result) {
      log('from verificationCompleted done');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(result.user as UserCredential)));
    }).catchError((e) {
      log('from verifyUser error');
      print(e);
      print("MOBILESS++>>$verifId");
    });
    ;
  }

}
