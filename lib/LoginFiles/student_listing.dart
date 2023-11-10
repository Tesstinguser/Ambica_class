import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_student.dart';
import 'Edit_Profile.dart';
import 'students_profiles.dart';
import 'students_details.dart';

class Student_Listing extends StatefulWidget {
  const Student_Listing({super.key});

  @override
  State<Student_Listing> createState() => _RespactedloginState();
}

class _RespactedloginState extends State<Student_Listing> {
  final Stream<QuerySnapshot> studentsStream =  FirebaseFirestore.instance.collection('demo').snapshots();
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder: (context) => AddandEditScreen()));
              },
              backgroundColor: Color(0xff454283),
              child: Icon(
                Icons.add,
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Color(0xff454283),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                padding: EdgeInsets.only(right: 20, top: 35),
                                child: Image.asset(
                                    "assets/Images/Vector.png"))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 15),
                              child: Text('Respacted Login',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 19)),
                            ),
                            Container(
                              height: 37,
                              margin: EdgeInsets.only(
                                  top: 15,
                                  left: 10,
                                  bottom: 15,
                                  right: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.09),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: storedocs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // for (var i = 0; i < storedocs.length; i++)
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => StudentDetilas(storedocs: storedocs,),));
                              },
                              child: Slidable(
                                startActionPane: ActionPane(
                                  motion: const BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.green,
                                      icon: Icons.call,
                                      label: 'Call',
                                    ),
                                  ],
                                ),
                                endActionPane: ActionPane(
                                  motion: const BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.orange,
                                      icon: Icons.share,
                                      label: 'Share',
                                    ),
                                  ],
                                ),
                                child: Card(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.green,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 5),
                                            Center(
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/Images/userimg.png',
                                                  width: 75,
                                                  height: 75,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.circular(10)),
                                                    color: Colors.green),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Text("Addmision"),
                                                )),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 0),
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment
                                                        .topRight,
                                                    child: Card(
                                                        margin: EdgeInsets.only(
                                                            top: 25, right: 10),
                                                        elevation: 11,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                CupertinoIcons
                                                                    .phone_arrow_down_left))),
                                                  ),
                                                  Align(
                                                    alignment: Alignment
                                                        .topRight,
                                                    child: Card(
                                                        margin: EdgeInsets.only(
                                                            right: 10,
                                                            bottom: 10,
                                                            top: 5),
                                                        elevation: 11,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(Icons
                                                                .message_outlined))),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 7),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    // for (var i = 0; i < storedocs.length; i++)
                                                    Text
                                                      ( storedocs[index]['name'],

                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        maxLines: 1,
                                                        overflow:
                                                        TextOverflow.ellipsis),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Phone no:',
                                                          style: TextStyle(
                                                              color:
                                                              Color(0xff666565),
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(storedocs[index]['number'],
                                                            style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xff454283),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Branch :',
                                                          style: TextStyle(
                                                              color:
                                                              Color(0xff666565),
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(storedocs[index]['branch'],
                                                            style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xff454283),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 15),
                                                            maxLines: 1),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      children: [
                                                        Text(
                                                          'Sem :',
                                                          style: TextStyle(
                                                              color:
                                                              Color(0xff666565),
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 16),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(storedocs[index]['sem'],
                                                            style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xff454283),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 15),
                                                            maxLines: 1),
                                                        SizedBox(width: 5),
                                                        Text('Year:',
                                                            style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xff666565),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 15)),
                                                        SizedBox(width: 5),
                                                        Text(storedocs[index]['year'],
                                                            style: TextStyle(
                                                                color:
                                                                Color(
                                                                    0xff454283),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 15),
                                                            maxLines: 1),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      storedocs[index]['clg/uni'
                                                          ''],
                                                      style: TextStyle(
                                                        color: Color(
                                                            0xff454283),
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 15,
                                                      ),
                                                      maxLines: 1,


                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              ),

              // Align(
              //     alignment: Alignment.topRight,
              //     // child: Container(padding: EdgeInsets.only(right: 15,top: 27),child: Image.network('https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',height: 40,width: 40,),))
              //     child: Container(padding: EdgeInsets.only(right: 20,top: 35),child: Image.asset("assets/Images/Vector.png"))),
            ),
          );
        }


    );
  }
}
