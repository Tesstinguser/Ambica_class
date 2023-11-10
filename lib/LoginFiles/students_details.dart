import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Edit_Profile.dart';
import 'students_profiles.dart';

class StudentDetilas extends StatefulWidget {
  final List storedocs;

  StudentDetilas({Key? key, required this.storedocs}) : super(key: key);

  @override
  State<StudentDetilas> createState() => _StudentDetilasState();
}

class _StudentDetilasState extends State<StudentDetilas> {

  final Stream<QuerySnapshot> studentsStream =  FirebaseFirestore.instance.collection('demo').snapshots();

  // For Deleting User
  CollectionReference students = FirebaseFirestore.instance.collection('demo');

  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();
    return Scaffold(
      backgroundColor: Color(0xff454283),
      body: SingleChildScrollView(
        child: SafeArea(
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
                      Text("Student’s Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      SizedBox(
                        height: 40,
                        width: 40,
                      ),
                      Row(
                        children: [

                          InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(msg: 'Delete user');
                                  deleteUser(storedocs[0]['id']);

                                  },
                             // onTap: () => {deleteUser(storedocs[0]['id']),},

                            child: Icon(Icons.delete_outline_rounded,
                                color: Colors.white, size: 35),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfile(id: storedocs[i]['id']),));
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => StudentsProfiles(),));
                              },
                              child: Icon(Icons.edit,
                                  color: Colors.white, size: 35)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: 15,
                      right: 15,
                      bottom: 17),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      // color: Colors.orange,
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 21),
                                              child: Text(
                                                  widget.storedocs[0]['name'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.073),
                                              Text(
                                                'Branch:',
                                                style: TextStyle(
                                                    color: Color(0xff666565),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                  widget.storedocs[0]['branch'],
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1),
                                              Text(
                                                'Sem :',
                                                style: TextStyle(
                                                    color: Color(0xff666565),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(width: 5),
                                              Text(widget.storedocs[0]['email'],
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                  maxLines: 1),
                                              SizedBox(width: 5),
                                              Text('Year:',
                                                  style: TextStyle(
                                                      color: Color(0xff666565),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                              SizedBox(width: 5),

                                              Text(widget.storedocs[0]['year'],
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                  maxLines: 1),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text('Subject:',
                                              style: TextStyle(
                                                  color: Color(0xff666565),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          SizedBox(height: 5),
                                          Container(
                                            margin: EdgeInsets.only(left: 25),
                                            child: Column(
                                              children: [
                                                Text('maths',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff454283),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                                Text(
                                                  'maths',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  'maths',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 0, left: 25),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/Images/userimg.png',
                                              width: 90,
                                              height: 90,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 30, right: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.red),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Inquirvyy"),
                                            )),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 19),
                                    InkWell(
                                      onTap: () {
                                        // _makingPhoneCall();
                                      },
                                      child: Icon(
                                        CupertinoIcons.phone_arrow_down_left,
                                        size: 23,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['number'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 19),
                                    Icon(Icons.email),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['email'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 19),
                                    child: Text(
                                      widget.storedocs[0]['clg/uni'],
                                      style: TextStyle(
                                        color: Color(0xff454283),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19, right: 19),
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19),
                                  child: Text(
                                    "Father's Detail’s:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sfname'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Occupations:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sfoccupations'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(
                                      CupertinoIcons.phone_arrow_down_left,
                                      size: 23,
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sfnumber'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(Icons.email),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sfemail'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19),
                                  child: Text(
                                    "Mother's's Detail’s:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['smname'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Occupations:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['smoccupations'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(
                                      CupertinoIcons.phone_arrow_down_left,
                                      size: 23,
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['smnumber'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(Icons.email),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['smemail'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19),
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
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sgname'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Occupations:',
                                      style: TextStyle(
                                          color: Color(0xff666565),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sgoccupations'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(
                                      CupertinoIcons.phone_arrow_down_left,
                                    ),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sgnumber'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Icon(Icons.email),
                                    SizedBox(width: 5),
                                    Text(widget.storedocs[0]['sgemail'],
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19),
                                  child: Text(
                                    "Student's Address:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(width: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    widget.storedocs[0]['addressline1'],
                                    style: TextStyle(
                                      color: Color(0xff666565),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    widget.storedocs[0]['addressline2'],
                                    style: TextStyle(
                                      color: Color(0xff666565),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    widget.storedocs[0]['addressline3'],
                                    style: TextStyle(
                                      color: Color(0xff666565),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  // _makingPhoneCall() async {
  //   var url = Uri.parse("tel:9776765434");
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
    );}
}
