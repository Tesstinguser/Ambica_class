// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Firestore Query')),
//         body: Center(child: CheckIfExists()),
//       ),
//     );
//   }
// }
//
// class CheckIfExists extends StatefulWidget {
//   @override
//   _CheckIfExistsState createState() => _CheckIfExistsState();
// }
//
// class _CheckIfExistsState extends State<CheckIfExists> {
//   bool _exists = false;
//
//   Future<void> checkIfExists() async {
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('YourCollection')
//         .doc('YourDocument')
//         .get();
//
//     if (documentSnapshot.exists) {
//       setState(() {
//         _exists = true;
//       });
//     } else {
//       setState(() {
//         _exists = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         RaisedButton(
//           onPressed: checkIfExists,
//           child: Text('Check If Exists'),
//         ),
//         SizedBox(height: 20),
//         Text(_exists ? 'Document Exists' : 'Document Does Not Exist'),
//       ],
//     );
//   }
// }
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class veryfycode extends StatefulWidget {
// //   const veryfycode({super.key});
// //
// //   @override
// //   State<veryfycode> createState() => _veryfycodeState();
// // }
// //
// // class _veryfycodeState extends State<veryfycode> {
// //   final _formKey = GlobalKey<FormState>();
// //
// //   var orgscode = "";
// //   var number = "";
// //
// //     // Create a text controller and use it to retrieve the current value
// //   // of the TextField.
// //     final orgController = TextEditingController();
// //   final numbercontroller = TextEditingController();
// //
// //   @override
// //   void dispose() {
// //     // Clean up the controller when the widget is disposed.
// //       orgController.dispose();
// //      numbercontroller.dispose();
// //     super.dispose();
// //   }
// //
// //   clearText() {
// //     orgController.clear();
// //     numbercontroller.clear();
// //   }
// //
// //   // Adding Student
// //   CollectionReference orgcode =
// //   FirebaseFirestore.instance.collection('orgcode');
// //
// //   Future<void> addUser() {
// //     return orgcode
// //         .doc('Autoid')
// //         .collection('students')
// //         .add({
// //       'orgcode': orgscode,
// //       'number': number
// //     })
// //         .then((value) => print('User Added'))
// //         .catchError((error) => print('Failed to Add user: $error'));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Verify'),
// //         centerTitle: true,
// //         backgroundColor: Color(0xff454283),
// //         // leading: Icon(Icons.arrow_back,size: 30),
// //       ),
// //       resizeToAvoidBottomInset: true,
// //       body: Form(
// //         key: _formKey,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               margin: EdgeInsets.symmetric(vertical: 10.0),
// //               child: TextFormField(
// //                 autofocus: false,
// //                 decoration: InputDecoration(
// //                   labelText: 'Orgcode: ',
// //                   labelStyle: TextStyle(fontSize: 20.0),
// //                   border: OutlineInputBorder(),
// //                   errorStyle:
// //                   TextStyle(color: Colors.redAccent, fontSize: 15),
// //                 ),
// //                 controller: orgController,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please Enter Name';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //             ),
// //
// //
// //             Container(
// //               margin: EdgeInsets.symmetric(vertical: 10.0),
// //               child: TextFormField(
// //                 autofocus: false,
// //                 decoration: InputDecoration(
// //                   labelText: 'Mo no: ',
// //                   labelStyle: TextStyle(fontSize: 20.0),
// //                   border: OutlineInputBorder(),
// //                   errorStyle:
// //                   TextStyle(color: Colors.redAccent, fontSize: 15),
// //                 ),
// //                 controller: numbercontroller,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please Enter Name';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // addUser(  );
// //                 // Validate returns true if the form is valid, otherwise false.
// //                 if (_formKey.currentState!.validate()) {
// //                   setState(() {
// //                     orgscode = orgController.text;
// //                     number = numbercontroller.text;
// //                     addUser(  );
// //                     clearText();
// //                   });
// //                 }
// //               },
// //               child: Text(
// //                 'Register',
// //                 style: TextStyle(fontSize: 18.0),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
