import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatefulWidget {
 String? text;
  OtpScreen(this.text,  {super.key});

  @override
  State<OtpScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<OtpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Column(
        children: [
          Text(widget.text!),
          Align(
            alignment: Alignment.center,
            child: Expanded(
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ),
          ),
        ],
      ),
    );
  }

}
