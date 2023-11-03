import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Students_Profiles.dart';

class StudentDetilas extends StatefulWidget {
  const StudentDetilas({super.key});

  @override
  State<StudentDetilas> createState() => _StudentDetilasState();
}

class _StudentDetilasState extends State<StudentDetilas> {
  @override
  Widget build(BuildContext context) {
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
                          Icon(Icons.delete_outline_rounded,
                              color: Colors.white, size: 35),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsProfiles(),));
                              },
                              child: Icon(Icons.edit, color: Colors.white, size: 35)),
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
                                              child: Text('UserName',
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
                                              Text('dummy ',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight: FontWeight.bold,
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
                                              Text('5',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                  maxLines: 1),
                                              SizedBox(width: 5),
                                              Text('Year:',
                                                  style: TextStyle(
                                                      color: Color(0xff666565),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15)),
                                              SizedBox(width: 5),
                                              Text('2023',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight: FontWeight.bold,
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
                                                        color: Color(0xff454283),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                                Text(
                                                  'maths',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  'maths',
                                                  style: TextStyle(
                                                      color: Color(0xff454283),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                              padding: const EdgeInsets.all(8.0),
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
                                    Icon(
                                      CupertinoIcons.phone_arrow_down_left,
                                      size: 23,


                                    ),
                                    SizedBox(width: 5),
                                    Text('917817878653 ',
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
                                    Text('mjbharmal@gmail.com ',
                                        style: TextStyle(
                                            color: Color(0xff454283),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 19),
                                    child: Text(
                                      "Marwadi University",
                                      style: TextStyle(
                                        color: Color(0xff454283),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19,right: 19),
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
                                    Text('dummy ',
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
                                    Text('dummy ',
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
                                    Text('917817878653 ',
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
                                    Text('mjbharmal@gmail.com ',
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
                                    Text('dummy ',
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
                                    Text('dummy ',
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
                                    Text('917817878653 ',
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
                                    Text('mjbharmal@gmail.com ',
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
                                    Text('dummy ',
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
                                    Text('dummy ',
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
                                    Text('917817878653 ',
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
                                    Text('mjbharmal@gmail.com ',
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
                                    "Addresline 1:",
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
                                    "Addresline 2:",
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
                                    "Addresline 3:",
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
}
