import 'dart:io';
import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/LoginFiles/student_listing.dart';

class AddandEditScreen extends StatefulWidget {
  const AddandEditScreen({super.key});

  @override
  State<AddandEditScreen> createState() => _AddState();
}

const double width = 300.0;
const double height = 56.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _AddState extends State<AddandEditScreen> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  final _formKey = GlobalKey<FormState>();
  var studensname = "";
  var branch = "";
  var sem = "";
  var year = "";
  var email = "";
  var number = "";
  var clg = "";
  var adrresline1 = "";
  var adrresline2 = "";
  var adrresline3 = "";
  var city = "";
  var zipcode = "";
  var state = "";
  var country = "";
  var subjects = "";
  var sfname = "";
  var sfoccupations = "";
  var sfemail = "";
  var sfnumber = "";
  var smname = "";
  var smoccupations = "";
  var smemail = "";
  var smnumber = "";
  var sgname = "";
  var sgoccupations = "";
  var sgemail = "";
  var sgnumber = "";
  File? imageUrl;

  final studensnamecontroller = TextEditingController();
  final branchnamecontroller = TextEditingController();
  final semcontroller = TextEditingController();
  final yearcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final clgcontroller = TextEditingController();
  final addres1controller = TextEditingController();
  final addres2controller = TextEditingController();
  final addres3controller = TextEditingController();
  final citycontroller = TextEditingController();
  final zipcodecontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final subjectscontroller = TextEditingController();
  final sfnamecontroller = TextEditingController();
  final sfoccupcontroller = TextEditingController();
  final sfemailcontroller = TextEditingController();
  final sfnumbercontroller = TextEditingController();
  final smnamecontroller = TextEditingController();
  final smoccupcontroller = TextEditingController();
  final smemailcontroller = TextEditingController();
  final smnumbercontroller = TextEditingController();
  final sgnamecontroller = TextEditingController();
  final sgoccupcontroller = TextEditingController();
  final sgemailcontroller = TextEditingController();
  final sgnumbercontroller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    studensnamecontroller.dispose();
    branchnamecontroller.dispose();
    semcontroller.dispose();
    yearcontroller.dispose();
    emailcontroller.dispose();
    numbercontroller.dispose();
    clgcontroller.dispose();
    addres1controller.dispose();
    addres2controller.dispose();
    addres3controller.dispose();
    citycontroller.dispose();
    zipcodecontroller.dispose();
    statecontroller.dispose();
    countrycontroller.dispose();
    subjectscontroller.dispose();
    sfnamecontroller.dispose();
    sfoccupcontroller.dispose();
    sfemailcontroller.dispose();
    sfnumbercontroller.dispose();
    smnamecontroller.dispose();
    smoccupcontroller.dispose();
    smemailcontroller.dispose();
    smnumbercontroller.dispose();
    sgnamecontroller.dispose();
    sgoccupcontroller.dispose();
    sgemailcontroller.dispose();
    sgnumbercontroller.dispose();
    super.dispose();
  }

  clearText() {
    studensnamecontroller.clear();
    branchnamecontroller.clear();
    semcontroller.clear();
    yearcontroller.clear();
    emailcontroller.clear();
    numbercontroller.clear();
    clgcontroller.clear();
    addres1controller.clear();
    addres2controller.clear();
    addres3controller.clear();
    citycontroller.clear();
    zipcodecontroller.clear();
    statecontroller.clear();
    countrycontroller.clear();
    subjectscontroller.clear();
    sfnamecontroller.clear();
    sfoccupcontroller.clear();
    sfemailcontroller.clear();
    sfnumbercontroller.clear();
    smnamecontroller.clear();
    smoccupcontroller.clear();
    smemailcontroller.clear();
    smnumbercontroller.clear();
    sgnamecontroller.clear();
    sgoccupcontroller.clear();
    sgemailcontroller.clear();
    sgnumbercontroller.clear();
  }

//   Future<void> addUser() async {
//     DocumentReference studentDocRef = FirebaseFirestore.instance.collection('students').doc();
//
// // Add data to the document using the set() method
//     studentDocRef.set({
//       'name': smnumber,
//       'age': smemail,
//       'major': smemail
//     })
//         .then((value) => print('Data added successfully'))
//         .catchError((error) => print('Failed to add data: $error'));
//   }
// Adding Student
//   CollectionReference org = FirebaseFirestore.instance.collection('org');

  // DocumentReference org = FirebaseFirestore.instance.collection('org').doc().collection('studnets').doc();

// Get a reference to the 'demo' collection
//   CollectionReference demoCollection = firestore.collection('demo');
//
// // Get a specific document within the 'demo' collection
//   DocumentReference specificDemoDocument = demoCollection.doc('documentID');
//
// // Access the 'students' sub-collection for that specific document
//   CollectionReference studentsCollection = specificDemoDocument.collection('students');
// Now you can work with the 'students' collection for that specific 'demo' document
//   DocumentReference org = FirebaseFirestore.instance.collection('demo').doc();

  DocumentReference org = FirebaseFirestore.instance.collection('org').doc('orgdetails').collection('students').doc();

  Future<void> addUser() async {
    // String imageUrl = await uploadImage();
    return org
        .set({
          'name': studensname,
          'branch': branch,
          'sem': sem,
          'year': year,
          'email': email,
          'number': number,
          'clg/uni': clg,
          'addressline1': adrresline1,
          'addressline2': adrresline2,
          'addressline3': adrresline3,
          'city': city,
          'zipcode': zipcode,
          'state': state,
          'country': country,
          'subjects': subjects,
          'sfname': sfname,
          'sfoccupations': sfoccupations,
          'sfemail': sfemail,
          'sfnumber': sfnumber,
          'smname': smname,
          'smoccupations': smoccupations,
          'smemail': smemail,
          'smnumber': smnumber,
          'sgname': sgname,
          'sgoccupations': sgoccupations,
          'sgemail': sgemail,
          'sgnumber': sgnumber,
          'sgimage': imageUrl,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  Future<String> uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('images/${DateTime.now().toString()}');
    UploadTask uploadTask = ref.putFile(imageUrl!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl; // Returning the URL of the uploaded image
  }

  // Future<String> uploadImageToStorage() async {
  //   // Get a reference to the Firebase Storage bucket
  //   firebase_storage.Reference storageRef =  `
  //   firebase_storage.FirebaseStorage.instance.ref().child('images');
  //
  //   // Upload the image file to Firebase Storage
  //   firebase_storage.UploadTask uploadTask = storageRef.child('image.jpg').putFile(imageFile);
  //
  //   // Wait for the upload to complete and get the download URL
  //   firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
  //   String imageUrl = await taskSnapshot.ref.getDownloadURL();
  //
  //   return imageUrl;
  // }
  File? _photo;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageUrl = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageUrl = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  // Future<void> uploadImage() async {
  //   // Read the image file
  //   String? imagePath = imageUrl?.path;
  //   final bytes = File(imagePath!).readAsBytesSync();
  //
  //   // Encode image file to base64
  //   final String base64Image = base64Encode(bytes);
  //
  //   // Create a Firestore document reference
  //   final CollectionReference imagesCollection =
  //   FirebaseFirestore.instance.collection('images');
  //
  //   // Add the base64 encoded image to Firestore
  //   await imagesCollection.add({'demo': base64Image});
  // }
  //  DocumentReference org = FirebaseFirestore.instance.collection('demo').doc();
  Future uploadFile() async {
    if (imageUrl == null) return;
    final fileName = basename(imageUrl!.path);
    final destination = 'demoimage/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('images/');
      await ref.putFile(imageUrl!);
    } catch (e) {
      print('error occured');
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // Future<void> uploadFile() async {
  //   if (_photo == null) return;
  //   final fileName = basename(_photo!.path);
  //   final destination = 'studentimages/$fileName';
  //   try {
  //     final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
  //     final uploadTask = ref.putFile(_photo!);
  //     final snapshot = await uploadTask.whenComplete(() => null);
  //     final imageUrl = await snapshot.ref.getDownloadURL();
  //
  //     // await FirebaseFirestore.instance.collection('demo').add({
  //     //       'image_url': imageUrl,
  //           await FirebaseFirestore.instance.collection('demo').add({
  //     'image_url': imageUrl ?? '', // Use an empty string as a fallback if imageUrl is null
  //     });
  //
  //   } catch (e) {
  //     print('Error occurred');
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }
  // FirebaseStorage storage = FirebaseStorage.instance;
  // // Select and image from the gallery or take a picture with the camera
  // // Then upload to Firebase Storage
  // Future<void> _upload(String inputSource) async {
  //   final picker = ImagePicker();
  //   XFile? pickedImage;
  //   try {
  //     pickedImage = await picker.pickImage(
  //         source: inputSource == 'camera'
  //             ? ImageSource.camera
  //             : ImageSource.gallery,
  //         maxWidth: 1920);
  //
  //     final String fileName = path.basename(pickedImage!.path);
  //     File imageFile = File(pickedImage.path);
  //
  //     try {
  //       // Uploading the selected image with some custom meta data
  //       await storage.ref(fileName).putFile(
  //           imageFile,
  //           SettableMetadata(customMetadata: {
  //             'uploaded_by': 'learners',
  //             'description': 'learning the hacks'
  //           }));
  //
  //       // Refresh the UI
  //       setState(() {});
  //     } on FirebaseException catch (error) {
  //       if (kDebugMode) {
  //         print(error);
  //       }
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //   }
  // }
  //
  // // Retriew the uploaded images
  // // This function is called when the app launches for the first time or when an image is uploaded or deleted
  // Future<List<Map<String, dynamic>>> _loadImages() async {
  //   List<Map<String, dynamic>> files = [];
  //
  //   final ListResult result = await storage.ref().list();
  //   final List<Reference> allFiles = result.items;
  //
  //   await Future.forEach<Reference>(allFiles, (file) async {
  //     final String fileUrl = await file.getDownloadURL();
  //     final FullMetadata fileMeta = await file.getMetadata();
  //     files.add({
  //       "url": fileUrl,
  //       "path": file.fullPath,
  //       "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
  //       "description":
  //       fileMeta.customMetadata?['description'] ?? 'No description'
  //     });
  //   });
  //
  //   return files;
  // }
  //
  // // Delete the selected image
  // // This function is called when a trash icon is pressed
  // Future<void> _delete(String ref) async {
  //   await storage.ref(ref).delete();
  //   // Rebuild the UI
  //   setState(() {});
  // }
  //
  Future<String> getImageUrls(String imagePath) async {
    Reference ref = FirebaseStorage.instance.ref().child(imagePath);
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

//crud with ai
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
// Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
              imageFile,
            );

// Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

// Retriew the uploaded images
// This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

// Delete the selected image
// This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
// Rebuild the UI
    setState(() {});
  }

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff454283),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    color: Color(0xff454283),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Text("Add Students",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07,
                        bottom: 23),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            width: double.infinity,
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    19,
                                  ),
                                  topRight: Radius.circular(19)),
                            ),
                            child: Stack(
                              children: [
                                AnimatedAlign(
                                  alignment: Alignment(xAlign, 0),
                                  duration: Duration(milliseconds: 300),
                                  child: Container(
                                    width: width * 0.6,
                                    height: height,
                                    decoration: BoxDecoration(
                                      color: Color(0xff454283),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            19,
                                          ),
                                          topRight: Radius.circular(19)),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      xAlign = loginAlign;
                                      loginColor = selectedColor;
                                      signInColor = normalColor;
                                      selectedValue = 'For Inquiry';
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment(-1, 0),
                                    child: Container(
                                      width: width * 0.5,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'For Inquiry',
                                        style: TextStyle(
                                          color: loginColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      xAlign = signInAlign;
                                      signInColor = selectedColor;
                                      loginColor = normalColor;
                                      selectedValue = 'For Admission';
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment(1, 0),
                                    child: Container(
                                      width: width * 0.5,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'For Admission',
                                        style: TextStyle(
                                          color: signInColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   'Selected Value: $selectedValue',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //   )),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 19, top: 30),
                                child: InkWell(
                                  onTap: () {
                                    _showPicker(context);
                                    // myAlert();
                                  },
                                  // child:FutureBuilder(
                                  //   future: _loadImages(),
                                  //   builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                                  //     if (snapshot.connectionState == ConnectionState.done) {
                                  //       return ListView.builder(
                                  //         itemCount: snapshot.data?.length ?? 0,
                                  //         itemBuilder: (context, index) {
                                  //           final Map<String, dynamic> image = snapshot.data![index];
                                  //
                                  //           return Card(
                                  //             margin: const EdgeInsets.symmetric(vertical: 10),
                                  //             child: ListTile(
                                  //               dense: false,
                                  //               leading: Image.network(image['url']),
                                  //               trailing: IconButton(
                                  //                 onPressed: () => _delete(image['path']),
                                  //                 icon: const Icon(
                                  //                   Icons.delete,
                                  //                   color: Colors.red,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       );
                                  //     } else {
                                  //       // Return a placeholder widget or an empty container when the future is not done
                                  //       return CircularProgressIndicator();
                                  //     }
                                  //   },
                                  // ),
                                  //
                                  // child: _photo != null
                                  //     ?  Expanded(
                                  //   child: FutureBuilder(
                                  //     future: _loadImages(),
                                  //     builder: (context,
                                  //         AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                                  //       if (snapshot.connectionState == ConnectionState.done) {
                                  //         return Expanded(
                                  //           child: ListView.builder(
                                  //             itemCount: snapshot.data?.length ?? 0,
                                  //             itemBuilder: (context, index) {
                                  //               final Map<String, dynamic> image =
                                  //               snapshot.data![index];
                                  //                  Image.network(image['url'],height: 50,width: 50,);
                                  //                 // title: Text(image['uploaded_by']),
                                  //                 // subtitle: Text(image['description']),
                                  //             },
                                  //           ),
                                  //         );
                                  //       }
                                  //       return const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       );
                                  //     },
                                  //   ),
                                  // )
                                  //     : Align(
                                  //         alignment: Alignment.topLeft,
                                  //         child: Padding(
                                  //           padding:
                                  //               const EdgeInsets.only(top: 50),
                                  //           child: Text("Select image",
                                  //               textAlign: TextAlign.end),
                                  //         )),
                                  child: imageUrl != null
                                      ? Container(
                                          margin: EdgeInsets.only(top: 7),
                                          child: Image.file(File(imageUrl!.path),width: MediaQuery.of(context).size.height *0.14,
                                          // child: Image.network(imageUrl!.path),width: MediaQuery.of(context).size.height *0.14,
                                            height: MediaQuery.of(context).size.height *0.14,
                                            // fit: BoxFit.cover,
                                          ))
                                      : Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 50),
                                            child: Text("Select image",
                                                textAlign: TextAlign.end),
                                          )),
                                  // child: Image.asset(
                                  //   'assets/Images/cameraimg.png',
                                  //   width: MediaQuery.of(context).size.height *
                                  //       0.14,
                                  //   height: MediaQuery.of(context).size.height *
                                  //       0.14,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 17),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.15),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 23, right: 23, top: 10),
                                          child: TextField(
                                            controller: studensnamecontroller,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Student’s  Name',
                                              labelText: 'Student’s  Name',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 23, right: 23, top: 10),
                                          child: TextField(
                                            controller: branchnamecontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Student’s  Brach',
                                              labelText: 'Student’s  Branch',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 23, right: 3, top: 10),
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            controller: semcontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Semester ',
                                              labelText: 'Semester',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 23, top: 10),
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            controller: yearcontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Year',
                                              labelText: 'Year',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s  Email',
                                        labelText: 'Student’s  Email',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      controller: numbercontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s  Number',
                                        labelText: 'Student’s  Number',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: clgcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'University/Institute',
                                        labelText: 'University/Institute',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: addres1controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Address Line-1 ',
                                        labelText: 'Student’s Address Line-1 ',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: addres2controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Address Line-2 ',
                                        labelText: 'Student’s Address Line-2 ',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: addres3controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Address Line-3',
                                        labelText: 'Student’s Address Line-3  ',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 23, right: 0, top: 10),
                                          child: TextField(
                                            controller: citycontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Student’s City ',
                                              labelText: 'Student’s City ',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 23, top: 10),
                                          child: TextField(
                                            controller: zipcodecontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Zip code',
                                              labelText: 'Zip code',
                                            ),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 23, right: 0, top: 10),
                                          child: TextField(
                                            controller: statecontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'State ',
                                              labelText: 'State',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 23, top: 10),
                                          child: TextField(
                                            controller: countrycontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Country',
                                              labelText: 'Country',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 23, right: 0, top: 10),
                                          child: TextField(
                                            controller: subjectscontroller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Subjects ',
                                              labelText: 'Subjects',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 10,
                                      ),
                                      Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.deepPurple,
                                                  width: 2)),
                                          child: Icon(
                                            CupertinoIcons.add,
                                            size: 25,
                                            color: Colors.deepPurple,
                                          )),
                                      SizedBox(
                                        height: 20,
                                        width: 10,
                                      ),
                                      Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.deepPurple,
                                                  width: 2)),
                                          child: Icon(
                                            CupertinoIcons.minus,
                                            size: 25,
                                            color: Colors.deepPurple,
                                          )),
                                      SizedBox(
                                        height: 20,
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 17),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Divider(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Father Detail’s:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sfnamecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Father Name',
                                        labelText: 'Student’s Father Name',
                                      ),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sfoccupcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Student’s Father Occupations',
                                        labelText:
                                            'Student’s Father Occupations',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sfemailcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Father Email',
                                        labelText: 'Student’s Father Email',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sfnumbercontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Father Number',
                                        labelText: 'Student’s Father Number',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Divider(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Mother Detail’s:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: smnamecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Mother Name',
                                        labelText: 'Student’s Mother Name',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: smoccupcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Student’s Mother Occupations',
                                        labelText:
                                            'Student’sMother Occupations',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: smemailcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Mother Email',
                                        labelText: 'Student’s Mother Email',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: smnumbercontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Mother Number',
                                        labelText: 'Student’s Mother Number',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Divider(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Guardian Detail’s:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sgnamecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Guardian Name',
                                        labelText: 'Student’s Guardian Name',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sgoccupcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Student’s Guardian Occupations',
                                        labelText:
                                            'Student’s Guardian Occupations',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sgemailcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Guardian Email',
                                        labelText: 'Student’s Guardian Email',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23, top: 10),
                                    child: TextField(
                                      controller: sgnumbercontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student’s Guardian Number',
                                        labelText: 'Student’s Guardian Number',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    30)))),
                                            child: Container(
                                              height: 60,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.32,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 10, top: 10),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // addUser();
                                                // clearText();
                                                setState(() {
                                                  // number = numbercontroller.text;
                                                  studensname =
                                                      studensnamecontroller
                                                          .text;
                                                  branch =
                                                      branchnamecontroller.text;
                                                  sem = semcontroller.text;
                                                  year = yearcontroller.text;
                                                  email = emailcontroller.text;
                                                  number = numbercontroller.text;
                                                  clg = clgcontroller.text;
                                                  adrresline1 =
                                                      addres1controller.text;
                                                  adrresline2 =
                                                      addres2controller.text;
                                                  adrresline3 =
                                                      addres3controller.text;
                                                  city = citycontroller.text;
                                                  zipcode =
                                                      zipcodecontroller.text;
                                                  state = statecontroller.text;
                                                  country =
                                                      countrycontroller.text;
                                                  subjects =
                                                      subjectscontroller.text;
                                                  sfname =
                                                      sfnamecontroller.text;
                                                  sfoccupations =
                                                      sfoccupcontroller.text;
                                                  sfemail =
                                                      sfemailcontroller.text;
                                                  sfnumber =
                                                      sfnumbercontroller.text;
                                                  smname =
                                                      smnamecontroller.text;
                                                  smoccupations =
                                                      smoccupcontroller.text;
                                                  smemail =
                                                      smemailcontroller.text;
                                                  smnumber =
                                                      smnumbercontroller.text;
                                                  sgname =
                                                      sgnamecontroller.text;
                                                  sgoccupations =
                                                      sgoccupcontroller.text;
                                                  sgemail =
                                                      sgemailcontroller.text;
                                                  sgnumber =
                                                      sgnumbercontroller.text;
                                                  addUser();
                                                  clearText();
                                                  Fluttertoast.showToast(
                                                      msg: 'Data Insertesd');
                                                  Navigator.pop(
                                                      context, selectedValue);
                                                  // Fluttertoast.showToast(msg: 'youhave select$selectedValue');
                                                });
                                              }
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => Student_Listing(imagePath: imageUrl),
                                              //   ),
                                              // );
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xff454283)),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    30)))),
                                            child: Container(
                                              height: 60,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.33,
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      // _upload('gallery');
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    // _upload('camera');
                    imgFromCamera();
                    // imgFromCamera();se
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
