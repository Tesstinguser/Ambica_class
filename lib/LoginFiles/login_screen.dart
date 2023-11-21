import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/LoginFiles/otp_verification.dart';
import 'package:untitled1/LoginFiles/student_listing.dart';
import '../Unusalbefile/OtpScreen.dart';
import '../Unusalbefile/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _imagetestingState();
}
class _imagetestingState extends State<LoginScreen> {
  String myText1 = 'ok';
  final orgController = TextEditingController();
  TextEditingController userController = TextEditingController();
  String? phoneNumber;
  TextEditingController codeController = TextEditingController();
  String verifId = '';
  bool isSent = false;
  bool _exists = false;

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
            log('from codeSent $verificationId');
            isSent = true;
            verifId = verificationId;
            setState(() {});
            // Save the verification ID and navigate to the OTP screen to enter the code.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPverification(verificationId),
              ),
            );
            print("USERIDD=>${verifId}");
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
  // Assuming you have a reference to the document
  Future<void> checkIfExists() async {

    // DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('org').doc().get();

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('org').where('orgcode', isEqualTo: orgController.text.toString()).get();
    if (querySnapshot.docs.isNotEmpty) {
      print("DATAPRINT=>${querySnapshot.docs[0].id}");
      // Fluttertoast.showToast(msg: 'we send otp as soon');

      QuerySnapshot querySnapshotin = await  FirebaseFirestore.instance.collection('org/${querySnapshot.docs[0].id}/users').where('mo_no', isEqualTo: userController.text.toString()).get();


      if(querySnapshotin.docs.isNotEmpty)
        {
          print("DATAPRINTOK=>${querySnapshotin.docs[0].id}");
          Fluttertoast.showToast(msg: 'We send otp soon');
          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPverification(userController.text),));
        }
      else{
        Fluttertoast.showToast(msg: 'Number is not valid');
      }

    } else {
      setState(() {
        _exists = false;
      });
      Fluttertoast.showToast(msg: 'org code is invalid');
    }



  }
  //  Future<void> checkIfExists() async {
  //
  //   // Assuming you have a Firestore instance called 'firestore' and a collection called 'yourCollection'
  //   //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('org').where('orgcode', isEqualTo: 'ambdi').get();
  //     // if (querySnapshot.docs.isNotEmpty) {
  //     //   Fluttertoast.showToast(msg: 'if');
  //     //   // Value exists and matches the input value
  //     // } else {
  //     //   // Value does not exist or does not match the input value
  //     //   Fluttertoast.showToast(msg: 'else');
  //     // }
  //     // if (querySnapshot.docs.isNotEmpty) {
  //     //   Fluttertoast.showToast(msg: 'if');
  //     //   // Value exists
  //     // } else {
  //     //   // Value does not exist
  //     //   Fluttertoast.showToast(msg: 'else');
  //     // }
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection('org')
  //       .doc()
  //       .get();
  //
  //   if (documentSnapshot.exists && (documentSnapshot.data() as Map).containsKey('orgcode ')) {
  //
  //     Fluttertoast.showToast(msg: 'true');
  //   } else {
  //
  //     Fluttertoast.showToast(msg: 'false');
  //   }
  // }

  // async {
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection('dummy')
  //       .doc('dummy')
  //       .get();
  //
  //   if (documentSnapshot.exists) {
  //     Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  //     if (data.containsKey('jeans')) {
  //       setState(() {
  //         _exists = true;
  //       });
  //       Fluttertoast.showToast(msg: 'true');
  //     } else {
  //       setState(() {
  //         _exists = false;
  //       });
  //       Fluttertoast.showToast(msg: 'false');
  //     }
  //   } else {
  //     setState(() {
  //       _exists = false;
  //     });
  //     Fluttertoast.showToast(msg: 'false');
  //   }
  // }


  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context as BuildContext).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context as BuildContext).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Student_Listing()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
          backgroundColor: Color(0xff454283),
        // leading: Icon(Icons.arrow_back,size: 30),
        ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
               Image.asset('assets/Images/Applogo.jpg',
                    height: MediaQuery.of(context).size.height*0.19,
                    width: MediaQuery.of(context).size.width*11
               ),
              Container(
                margin: EdgeInsets.only(left: 25 ),
                  child: Text('Welcome to Ambica Classes',style: TextStyle(fontSize: 30,color: Color(0xff182035),fontWeight: FontWeight.bold))),
              Row(
                children: [
                  Container(margin: EdgeInsets.only(left:  25,top: 15),child: Text('we have send you an ',style: TextStyle(fontSize: 14.5),)),
                  Container(margin: EdgeInsets.only(top: 10),child: Text('One Time Password(OTP)',style: TextStyle(color: Color(0xff182035),fontWeight: FontWeight.bold))),

                  ],
              ),
                    Container(margin: EdgeInsets.only(left: 25,),alignment: Alignment.topLeft,child: Text('on this number')),
                    Container(margin: EdgeInsets.only(left: 25,top: 20),alignment: Alignment.topLeft,child: Text('Enter Mobile no.*',)),
              //       Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)
              //         ),
              //         margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05,right: 20),
              //         child: IntlPhoneField(
              //   controller: userController,
              //   decoration: InputDecoration(
              //     labelText: 'Phone Number',
              //     border: InputBorder.none,
              //   ),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {
              //     phoneNumber = phone.completeNumber;
              //   },
              // ),
              //       ),
              // Row(
              //  children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height*0.064,width: 50,
              //         margin: EdgeInsets.only(left: 25,top: 5,),padding: EdgeInsets.only(left: 10,top: 17),
              //         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)),
              //         child: Align(alignment: Alignment.topLeft,child: Text("+91"))
              //     ),
              //     Flexible(
              //       flex: 1,
              //       child: Container(
              //         margin: EdgeInsets.only(left: 10,top: 5,right: 20),padding: EdgeInsets.only(left: 10),
              //         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)),
              //         child: TextField(
              //           controller: userController,
              //           decoration:  InputDecoration(
              //             hintText: "Enter Mobile Number",
              //             border: InputBorder.none,
              //             // labelText: 'Enter mobile number',
              //           ),
              //         ),
              //       ),
              //     ),
              //
              //   ],
              // ),
              Container(
               margin: EdgeInsets.only(left: 19,right: 19,top: 10),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                    labelText: 'Orgcode ',alignLabelWithHint: true,
                    labelStyle: TextStyle(fontSize: 20.0),

                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: orgController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 19,right: 19,top: 10),
                child: IntlPhoneField(
                  controller: userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Phone Number',

                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                  },
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: double.infinity,
                margin: EdgeInsets.only(left: 25,right: 20,top: 20),
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff555288))),
                    onPressed: () {
                        if(userController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Please enter mobile number");
                          }
                        else{
                        // Fluttertoast.showToast(msg: 'ok');
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => OTPverification(userController.text),));
                          // _signInWithPhone(context);
                          // isSent
                          //     ? verifyUser()
                          //     : registerUser(userController.text, context);

                          checkIfExists();
                          }
                             },
                     child: Text("Get Code")),
              )
            ],
          ),
      ),

    ) ;
    //   Container(
    //   color: Colors.white,
    //   child: Image.asset('assets/Images/Applogo.jpg'),
    // );
  }
  // Future registerUser(String mobile, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: mobile,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential authCredential) {
  //         log('from verificationCompleted');
  //         _auth
  //             .signInWithCredential(authCredential)
  //             .then((UserCredential result) {
  //           log('from verificationCompleted done');
  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) =>
  //                       HomeScreen(result.user as UserCredential)));
  //         }).catchError((e) {
  //           log('from verificationCompleted error');
  //           print(e);
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         log('from verificationFailed');
  //         if (e.phoneNumber == 'invalid-phone-number') {
  //           print('The provided phone number is not valid.');
  //           Fluttertoast.showToast(msg: e.code);
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         log('from codeSent $verificationId');
  //         isSent = true;
  //         verifId = verificationId;
  //         setState(() {});
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         log('from codeAutoRetrievalTimeout $verificationId');
  //         // Auto-resolution timed out...
  //       });
  //   print("MOBILESS++>>$mobile");
  //   print("MOBILESS++>>$verifId");
  // }
  // verifyUser() async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   // Update the UI - wait for the user to enter the SMS code
  //   String smsCode = codeController.text.trim();
  //
  //   // Create a PhoneAuthCredential with the code
  //   PhoneAuthCredential credential =
  //   PhoneAuthProvider.credential(verificationId: verifId, smsCode: smsCode);
  //
  //   // Sign the user in (or link) with the credential
  //   await _auth.signInWithCredential(credential).then((UserCredential result) {
  //     log('from verificationCompleted done');
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => HomeScreen(result.user as UserCredential)));
  //   }).catchError((e) {
  //     log('from verifyUser error');
  //     print(e);
  //     print("MOBILESS++>>$verifId");
  //   });
  //   ;
  // }

}
