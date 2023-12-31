import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfile extends StatefulWidget {
  final String id;

  const EditProfile({Key? key, required this.id}) : super(key: key);

  @override
  State<EditProfile> createState() => _AddState();
}

class _AddState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  File? editimageUrl;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        editimageUrl = File(pickedFile.path);
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
        editimageUrl = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (editimageUrl == null) return;
    final fileName = basename(editimageUrl!.path);
    final destination = 'demoimage/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('images/');
      await ref.putFile(editimageUrl!);
    } catch (e) {
      print('error occured');
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // Updaing Student
  CollectionReference students = FirebaseFirestore.instance
      .collection('org')
      .doc('orgdetails')
      .collection('students');

  Future<void> updateUser(id, name, email, number, adrresline1, adrresline2,
      adrresline3, city, zipcode, state, country, imageurl) async {
    students
        .doc(id)
        .update({
          'name': name,
          'email': email,
          'number': number,
          'addressline1': adrresline1,
          'addressline2': adrresline2,
          'addressline3': adrresline3,
          'city': city,
          'zipcode': zipcode,
          'state': state,
          'country': country,
          'sgimage': imageurl,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff454283),
      body: Form(
        key: _formKey,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('org')
                .doc("orgdetails")
                .collection("students")
                .doc(widget.id)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              var data = snapshot.data!.data();
              var name = data!['name'];
              var email = data['email'];
              var number = data['number'];
              var adrresline1 = data['addressline1'];
              var adrresline2 = data['addressline2'];
              var adrresline3 = data['addressline3'];
              var city = data['city'];
              var zipcode = data['zipcode'];
              var state = data['state'];
              var country = data['country'];
              var imageurl = data['sgimage'];

              return SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 70,
                          color: const Color(0xff454283),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              const Text("Profile Edit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.08,
                              left: 0,
                              right: 0,
                              bottom: 20),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                                color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 17,
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                InkWell(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        // child: Image.network(imageurl,
                                        // child: Image.asset('assets/Images/cameraimg.png',
                                        child: imageurl != null &&
                                                imageurl.isNotEmpty
                                            ? Image.file(
                                                File(editimageUrl != null
                                                    ? editimageUrl!.path
                                                    : imageurl),
                                                // File(editimageUrl?.toString() ?? imageurl?.toString() ?? '',),
                                                // imageurl,
                                                //   imageurl,
                                                // editimageUrl != null ? editimageUrl: imageurl,
                                                // e  ditimageUrl ?? imageurl,
                                                // imageurl,
                                                // editimageUrl?.toString() ?? imageurl?.toString() ?? '',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.14,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.14,
                                                fit: BoxFit.cover,
                                              )
                                            : const Text('no select images')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    initialValue: name,
                                    autofocus: false,
                                    onChanged: (value) => name = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Name',
                                      labelText: 'Name',
                                    ),
                                  ),
                                ),

                                // TextFormField(
                                //   initialValue: email,
                                //   autofocus: false,
                                //   onChanged: (value) => email = value,
                                //   decoration: InputDecoration(
                                //     labelText: 'Email: ',
                                //     labelStyle: TextStyle(fontSize: 20.0),
                                //     border: OutlineInputBorder(),
                                //     errorStyle:
                                //     TextStyle(color: Colors.redAccent, fontSize: 15),
                                //   ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please Enter Email';
                                //     } else if (!value.contains('@')) {
                                //       return 'Please Enter Valid Email';
                                //     }
                                //     return null;
                                //   },
                                // ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    initialValue: email,
                                    autofocus: false,
                                    onChanged: (value) => email = value,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Email',
                                      labelText: 'Email',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Email';
                                      } else if (!value.contains('@')) {
                                        return 'Please Enter Valid Email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    initialValue: number,
                                    autofocus: false,
                                    onChanged: (value) => number = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Number',
                                      labelText: 'Number',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    initialValue: adrresline1,
                                    autofocus: false,
                                    onChanged: (value) => adrresline1 = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'AddresLine1',
                                      labelText: 'AddresLine1',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    initialValue: adrresline2,
                                    autofocus: false,
                                    onChanged: (value) => adrresline2 = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'AddresLine2',
                                      labelText: 'AddresLine2',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextFormField(
                                    initialValue: adrresline3,
                                    autofocus: false,
                                    onChanged: (value) => adrresline3 = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'AddresLine3',
                                      labelText: 'AddresLine3',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 23, right: 0, top: 10),
                                        child: TextFormField(
                                          initialValue: city,
                                          autofocus: false,
                                          onChanged: (value) => city = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Student’s City ',
                                            labelText: 'Student’s City ',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 23, top: 10),
                                        child: TextFormField(
                                          initialValue: zipcode,
                                          autofocus: false,
                                          onChanged: (value) => zipcode = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Zip code',
                                            labelText: 'Zip code',
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
                                        padding: const EdgeInsets.only(
                                            left: 23, right: 0, top: 10),
                                        child: TextFormField(
                                          initialValue: state,
                                          autofocus: false,
                                          onChanged: (value) => state = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'State ',
                                            labelText: 'State',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 23, top: 10),
                                        child: TextFormField(
                                          initialValue: country,
                                          autofocus: false,
                                          onChanged: (value) => country = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Country',
                                            labelText: 'Country',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  const MaterialStatePropertyAll(
                                                      Colors.red),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                          child: SizedBox(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.close,
                                                    color: Colors.white),
                                                Text('Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10, top: 10),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color(0xff454283)),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                          child: SizedBox(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.33,
                                            child: InkWell(
                                              onTap: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  updateUser(
                                                      widget.id,
                                                      name,
                                                      email,
                                                      number,
                                                      adrresline1,
                                                      adrresline2,
                                                      adrresline3,
                                                      city,
                                                      zipcode,
                                                      state,
                                                      country,
                                                      imageurl);
                                                  Navigator.pop(context);

                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Listing()));
                                                }
                                              },
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
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
              ));
            }),
      ),
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
