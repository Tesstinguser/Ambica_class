import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled1/LoginFiles/OTP_Verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _imagetestingState();
}

class _imagetestingState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  String? phoneNumber;

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
      body:  Column(
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
            Row(
             children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.064,width: 50,
                    margin: EdgeInsets.only(left: 25,top: 5,),padding: EdgeInsets.only(left: 10,top: 17),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)),
                    child: Align(alignment: Alignment.topLeft,child: Text("+91"))
                ),
                Flexible(
                  flex: 1,

                  child: Container(

                    margin: EdgeInsets.only(left: 10,top: 5,right: 20),padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)),
                    child: TextField(

                      controller: userController,
                      decoration:  InputDecoration(
                        hintText: "Enter Mobile Number",
                        border: InputBorder.none,
                        // labelText: 'Enter mobile number',

                      ),
                    ),
                  ),
                ),

              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25,right: 20,top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff555288))),
                  onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OTPverification(),));
              }, child: Text("Get Code")),
            )
          ],
        ),

    ) ;
    //   Container(
    //   color: Colors.white,
    //   child: Image.asset('assets/Images/Applogo.jpg'),
    // );
  }
}
