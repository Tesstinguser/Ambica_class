import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:timer_count_down/timer_count_down.dart';


import 'Student_Listing.dart';

class OTPverification extends StatefulWidget {
  const OTPverification({super.key});

  @override
  State<OTPverification> createState() => _TTPverificationState();
}

class _TTPverificationState extends State<OTPverification> {
  @override
  static const countdownDuration = Duration(minutes: 2);
  late Timer _timer;
  Duration _duration = countdownDuration;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration -= const Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color(0xff454283),
        leading: Icon(Icons.arrow_back,size: 30),
      ),
      body: Column(
        children: [

          Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
            child: Align(alignment: Alignment.center,
              child: Text("OTP Verification",
                  style: TextStyle(color: Color(0xff182035),fontSize: 25,fontWeight: FontWeight.bold)

              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 10,left: 20,right: 20),child: Text('Enter the code from the sms we sent  ',style: TextStyle(fontSize: 18,color: Color(0xff606268)),)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin: EdgeInsets.only(top: 5),child: Text('to ',style: TextStyle(fontSize: 18,color: Color(0xff606268)),)),
              Container(margin: EdgeInsets.only(top: 5),child: Text('+919825985265',style: TextStyle(fontSize: 18,color: Color(0xff182035)),)),
            ],
          ),
    //         Countdown(
    //         seconds: 120,
    //
    //            build: (BuildContext context, double time) => Text(time.toString()),
    // interval: Duration(milliseconds: 100),
    // onFinished: () {
    //
    // },
    // ),
          Container(margin:EdgeInsets.only(top: 10),
              child: Text("${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",style: TextStyle(fontSize: 17),)),
          Container(
            margin: EdgeInsets.only(top: 17),
            child: Align(

              alignment: Alignment.center,
              child: Expanded(
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF454283),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {

                  }, // end onSubmit
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(margin: EdgeInsets.only(top: 20)
                ,child: Text("I didn't receive any code."),),
              Container(margin: EdgeInsets.only(top: 20),child: Text("RESEND",style: TextStyle(color: Color(0xff454283))),),
            ],
          ),
          Align(

            child: Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25,right: 20,top: MediaQuery.of(context).size.height*0.4),
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff555288))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Listing(),));
                  }, child: Text("Submit")),
            ),
          ),

        ],
      ),
    );
  }
}
