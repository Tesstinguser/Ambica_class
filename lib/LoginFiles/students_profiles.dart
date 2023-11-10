import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Edit_Profile.dart';

class StudentsProfiles extends StatefulWidget {
  const StudentsProfiles({super.key});

  @override
  State<StudentsProfiles> createState() => _StudentDetilasState();
}

class _StudentDetilasState extends State<StudentsProfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff454283),
      body: SafeArea(
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
                    Text("Profile",
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
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.19,
                        ),
                        InkWell(
                            onTap: () {
                              // for (var i = 0; i < storedocs.length; i++)
                              //   Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfile(id: storedocs[i]['id'])));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => EditProfile(),
                              //     ));
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
                    left: 10,
                    right: 10,
                    bottom: 10),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5),
                                      Center(
                                        child: Container(
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
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 10),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Ralph Edwards",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                              SizedBox(width: 17),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 23, right: 23),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 17),
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Text(
                                  "Address:",
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
                                  "Street line 1, ",
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
                                  "Street line 2",
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
                                  "Street line 3,:",
                                  style: TextStyle(
                                    color: Color(0xff666565),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 370,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 5,
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
    );
  }
}
