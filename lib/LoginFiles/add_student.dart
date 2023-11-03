import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff454283),
      body: SafeArea(
          child: SingleChildScrollView(
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
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,bottom: 23),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 19,top: 30),
                              child: Image.asset(
                                'assets/Images/cameraimg.png',
                                width: MediaQuery.of(context).size.height*0.14,
                                height: MediaQuery.of(context).size.height*0.14,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(height: 17),
                                Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.15),
                                  child: Column(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 23, right: 23, top: 10),
                                        child: TextField(
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
                                          decoration: InputDecoration(
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
                                        padding: EdgeInsets.only(
                                            left: 23, right: 0, top: 10),
                                        child: TextField(
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
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Divider(color: Colors.black,),
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Father Name',
                                      labelText: 'Student’s Father Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Father Occupations',
                                      labelText: 'Student’s Father Occupations',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextField(
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Father Number',
                                      labelText: 'Student’s Father Number',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Mother Occupations',
                                      labelText: 'Student’sMother Occupations',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextField(
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Mother Number',
                                      labelText: 'Student’s Mother Number',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Guardian Occupations',
                                      labelText: 'Student’s Guardian Occupations',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23, top: 10),
                                  child: TextField(
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Student’s Guardian Number',
                                      labelText: 'Student’s Guardian Number',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10, bottom: 10),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.red),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                          child: Container(
                                            height: 60,
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.36,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.close),
                                                Text('Cancel')
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
                                              MaterialStatePropertyAll(
                                                  Color(0xff454283)),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                          child: Container(
                                            height: 60,
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.37,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add),
                                                Text('Save')
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
      )),
    );
  }
}
