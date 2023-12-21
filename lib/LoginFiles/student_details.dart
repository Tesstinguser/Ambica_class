import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Edit_Profile.dart';


class StudentDetilas extends StatefulWidget {
  final List? storedocs;
  final int index;
  const StudentDetilas({Key? key, required this.storedocs,required this.index}) : super(key: key);
  @override
  State<StudentDetilas> createState() => _StudentDetilasState();
 }
class _StudentDetilasState extends State<StudentDetilas> {
  final Stream<QuerySnapshot> studentsStream =   FirebaseFirestore.instance.collection('org').doc('orgdetails').collection('students').snapshots();
  // final Stream<QuerySnapshot>  studentsStream = FirebaseFirestore.instance.collection('demo').snapshots();
  // For Deleting User
  // DocumentReference org = FirebaseFirestore.instance.collection('org').doc('orgdetails').collection('students').doc();

  CollectionReference students = FirebaseFirestore.instance.collection('org').doc('orgdetails').collection('students');
  Future<void> deleteUser(id) {
        // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
  FirebaseStorage storage = FirebaseStorage.instance;
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
            backgroundColor: const Color(0xff454283),
            body: SingleChildScrollView(
              child: SafeArea(
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
                            const Text("Student’s Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            const SizedBox(
                              height: 40,
                              width: 40,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context,true);
                                    Fluttertoast.showToast(msg: 'Delete user');
                                    deleteUser(storedocs[widget.index]['id']);
                                  },
                                  // onTap: () => {deleteUser(storedocs[widget.index]['id']),},
                                  child: const Icon(Icons.delete_outline_rounded,
                                      color: Colors.white, size: 35),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                    onTap: () {
                                      // for (var i = 0; i < storedocs.length; i++)
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfile(id: storedocs[widget.index]['id']),));
                                      // Navigator.push(context,MaterialPageRoute(builder: (context) => StudentsProfiles(),));
                                    },
                                    child: const Icon(Icons.edit,
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
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            // color: Colors.orange,
                                            child: Column(
                                              children: [
                                                // for (var i = 0; i < storedocs.length; i++)

                                                Container(
                                                    margin: const EdgeInsets.only(
                                                        left: 21),
                                                    child: Text(
                                                        widget.storedocs![widget.index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.073),
                                                    const Text(
                                                      'Branch:',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff666565),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        widget.storedocs![widget.index]
                                                            ['branch'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff454283),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15)),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.1),
                                                    const Text(
                                                      'Sem :',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff666565),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        widget.storedocs![widget.index]
                                                            ['sem'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff454283),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                        maxLines: 1),
                                                    const SizedBox(width: 5),
                                                    const Text('Year:',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff666565),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15)),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        widget.storedocs![widget.index]
                                                            ['year'],
                                                        style:  const TextStyle(
                                                            color: Color(
                                                                0xff454283),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                        maxLines: 1),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                const Text('Subject:',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff666565),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15)),
                                                const SizedBox(height: 5),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.only(left: 25),
                                                  child: const Column(
                                                    children: [
                                                      Text('maths',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff454283),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16)),
                                                      Text(
                                                        'maths',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff454283),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        'maths',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff454283),
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
                                              const SizedBox(height: 5),
                                              Container(
                                                margin: const EdgeInsets.only(top: 0, left: 25),
                                                child: ClipOval(
                                                  child: widget.storedocs![widget.index]["sgimage"] != null && widget.storedocs![widget.index]["sgimage"].isNotEmpty
                                                ? Image.network(widget.storedocs![widget.index]["sgimage"],
                                                  width: 75,
                                                  height: 75,
                                                  fit: BoxFit.cover,
                                                )
                                                    : Align(
                                                    alignment: Alignment.topLeft,
                                                      child: Container(
                                                        padding: const EdgeInsets.only(left: 10,top: 18),
                                                          height: 75,width: 75,
                                                          child: const Text('No Select Images'))
                                                    ),

                                                  // child: Image.asset('assets/Images/userimg.png',width: 90,height: 90,fit: BoxFit.cover,),
                                                  // child: FutureBuilder(
                                                  //   future: _loadImages(),
                                                  //   builder: (context,AsyncSnapshot<List<Map<String,dynamic>>>snapshot) {
                                                  //     if (snapshot.connectionState ==
                                                  //         ConnectionState.done) {
                                                  //       List<Map<String, dynamic>>
                                                  //       images = snapshot.data ?? [];
                                                  //       if (images.isNotEmpty) {
                                                  //         int index = 0;
                                                  //         Map<String, dynamic> image = images[index]; // Accessing the first image in the array
                                                  //         return Image.network(
                                                  //           image['url'],
                                                  //           width: 75,
                                                  //           height: 75,
                                                  //         );
                                                  //       }
                                                  //       // return Column(
                                                  //       //   children:
                                                  //       //       images.map((image) {
                                                  //       //     return Image.network(
                                                  //       //       image['url'],
                                                  //       //       width: 75,
                                                  //       //       height: 75,
                                                  //       //     );
                                                  //       //   }).toList(),
                                                  //       // );
                                                  //     }
                                                  //     return Align(alignment: Alignment.topLeft,
                                                  //       // child: CircularProgressIndicator(),
                                                  //       child: Padding(padding: EdgeInsets.only(left: 10),child: Text('select image',)),
                                                  //     );
                                                  //   },
                                                  // ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 30, right: 10),
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: Colors.red),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(
                                                            8.0),
                                                    child: Text("Inquirvyy"),
                                                  )),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 19),
                                          InkWell(
                                            onTap: () {
                                               // _makingPhoneCall();
                                            },
                                            child: const Icon(
                                              CupertinoIcons
                                                  .phone_arrow_down_left,
                                              size: 23,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['number'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 19),
                                          const Icon(Icons.email),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['email'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(left: 19),
                                          child: Text(
                                            widget.storedocs![widget.index]['clg/uni'],
                                            style: const TextStyle(
                                              color: Color(0xff454283),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                            maxLines: 1,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 19, right: 19),
                                        child: Divider(
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 17),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 19),
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
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Name:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sfname'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Occupations:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                              widget.storedocs![widget.index]
                                                  ['sfoccupations'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(
                                            CupertinoIcons
                                                .phone_arrow_down_left,
                                            size: 23,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sfnumber'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(Icons.email),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sfemail'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(width: 17),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 19),
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
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Name:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['smname'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Occupations:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                              widget.storedocs![widget.index]
                                                  ['smoccupations'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(
                                            CupertinoIcons
                                                .phone_arrow_down_left,
                                            size: 23,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['smnumber'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(Icons.email),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['smemail'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(width: 17),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 19),
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
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Name:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sgname'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Text(
                                            'Occupations:',
                                            style: TextStyle(
                                                color: Color(0xff666565),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                              widget.storedocs![widget.index]
                                                  ['sgoccupations'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(
                                            CupertinoIcons
                                                .phone_arrow_down_left,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sgnumber'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          const Icon(Icons.email),
                                          const SizedBox(width: 5),
                                          Text(widget.storedocs![widget.index]['sgemail'],
                                              style: const TextStyle(
                                                  color: Color(0xff454283),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 17),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 19),
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
                                      const SizedBox(width: 17),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Text(
                                          widget.storedocs![widget.index]['addressline1'],
                                          style: const TextStyle(
                                            color: Color(0xff666565),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Text(
                                          widget.storedocs![widget.index]['addressline2'],
                                          style: const TextStyle(
                                            color: Color(0xff666565),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Text(
                                          widget.storedocs![widget.index]['addressline3'],
                                          style: const TextStyle(
                                            color: Color(0xff666565),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
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
        );
  }
}
