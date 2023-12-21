import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/LoginFiles/student_details.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:untitled1/LoginFiles/students_details.dart';
import 'add_student.dart';


class Student_Listing extends StatefulWidget {
  const Student_Listing({super.key});

  @override
  State<Student_Listing> createState() => _RespactedloginState();
}

class _RespactedloginState extends State<Student_Listing> {
  // final Stream<QuerySnapshot> studentsStream =   FirebaseFirestore.instance.collection('demo').snapshots();
  final Stream<QuerySnapshot> studentsStream =   FirebaseFirestore.instance.collection('org').doc('orgdetails').collection('students').snapshots();
  List displaylist = [];
  final List storedocs = [];


  // Future<String> getImageUrl() async {
  //   final ref = FirebaseStorage.instance.ref().child('studentsimages');
  //   var url = await ref.getDownloadURL();
  //   return url;
  // }
  // Future<String> uploadFile(File image) async
  // {
  //   String downloadURL;
  //   String postId=DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference ref = FirebaseStorage.instance.ref().child("images").child("post_$postId.jpg");
  //   await ref.putFile(image);
  //   downloadURL = await ref.getDownloadURL();
  //   return downloadURL;
  // }
  // searchfunction(var SearchText) {
  //   setState(() {});
  //   arrTempNutritonList.clear();
  //   if (SearchText.toString().trim().isNotEmpty) {
  //     for (var nunutrition in arrNutritonList) {
  //       if (nunutrition.NutritionTitle.toLowerCase()
  //           .contains(SearchText.toString().toLowerCase())) {
  //         arrTempNutritonList.add(nunutrition);
  //       }
  //     }
  //     if (arrTempNutritonList.isEmpty) {
  //       Fluttertoast.showToast(msg: "Not matched");
  //     }
  //   } else {
  //     arrTempNutritonList.addAll(arrNutritonList);
  //   }
   // }



  searchfunction(var SearchText) {
    if (SearchText.toString().trim().isNotEmpty) {
      List searchResults = [];
      searchResults.clear();
      for (var doc in storedocs) {
        String name = doc['name'] ?? '';
        if (name.toLowerCase().contains(SearchText.toLowerCase())) {
          searchResults.add(doc);
        }
      }
      print("Studentsname=>${searchResults}");
      print("Studentsname=>${searchResults.length}");
      if (searchResults.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Name matched!",
        );
      } else {
        Fluttertoast.showToast(
          msg: "No name matched!",
        );
        // searchResults.clear();
        // searchResults.addAll(storedocs);
      }
      displaylist = searchResults;
      // displaylist = storedocs;
    } else {
      displaylist = storedocs;
    }
    print("aaa${displaylist.length}");
    setState(() {});
  }

  // Future<String> getImageUrls(String imagePath) async {
  //   Reference ref = FirebaseStorage.instance.ref().child(imagePath);
  //   String downloadURL = await ref.getDownloadURL();
  //   return downloadURL;
  // }
  // String? imageUrlst;
  @override
  void initState() {
    super.initState();
  }

  // Future<void> getImageUrlyou() async {
  //   try {
  //     String url = await FirebaseStorage.instance.ref().child('studentimages').getDownloadURL();
  //     setState(() {
  //       imageUrlst = url;
  //     });
  //     print('true');
  //
  //     // Fetch and display the image
  //     Image image = Image.network(url);
  //     // Use the 'image' widget in your UI to display the image
  //   } catch (e) {
  //     print(e.toString());
  //     Fluttertoast.showToast(msg: e.toString());
  //
  //     // Handle error case when image URL cannot be retrieved
  //   }
  // }
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
      // await file.delete(); // delete firebse dtorage
    });
    return files;
  }
  //   Future<void> deleteFile() async {
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref().child('demoimage');
  //     await storageRef.delete();
  //     print('File deleted successfully');
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //     print('Error deleting file: $e');
  //   }
  // }
  String text = '';
  String link = '';
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
          storedocs.clear();

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              storedocs.add(a);
              a['id'] = document.id;
            }).toList();
          }
          displaylist = storedocs;
          // storedocs.clear();
          // snapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map a = document.data() as Map<String, dynamic>;
          //   storedocs.add(a);
          //   a['id'] = document.id;
          // }).toList();
          // displaylist = storedocs;
          // storedocs.clear();
          // displaylist = storedocs;
          // displaylist.addAll(storedocs);
          // displaylist.clear();
          // searchfunction(var SearchText) {
          //   setState(() {});
          //   arrTempNutritonList.clear();
          //   if (SearchText.toString().trim().isNotEmpty) {
          //     for (var nunutrition in arrNutritonList) {
          //       if (nunutrition.NutritionTitle.toLowerCase()
          //           .contains(SearchText.toString().toLowerCase())) {
          //         arrTempNutritonList.add(nunutrition);
          //       }
          //     }
          //     if (arrTempNutritonList.isEmpty) {
          //       Fluttertoast.showToast(msg: "Not matched");
          //     }
          //   } else {
          //     arrTempNutritonList.addAll(arrNutritonList);
          //   }
          // }
          // searchfunction(var SearchText) {
          //   setState(() {
          //     if (SearchText.toString().trim().isNotEmpty){
          //       List searchResults = storedocs.where((doc) {
          //         String name = doc['name'] ?? '';
          //         return name.toLowerCase().contains(SearchText.toLowerCase());
          //       }).toList();
          //       print("Studentsname=>${searchResults}");
          //       print("Studentsname=>${searchResults.length}");
          //     }
          //   });
          // }
          // searchfunction(var SearchText) {
          //   setState(() {});
          //   arrTempNutritonList.clear();
          //   if (SearchText.toString().trim().isNotEmpty) {
          //     for (var nunutrition in arrNutritonList) {
          //       if (nunutrition.NutritionTitle.toLowerCase()
          //           .contains(SearchText.toString().toLowerCase())) {
          //         arrTempNutritonList.add(nunutrition);
          //       }
          //     }
          //     if (arrTempNutritonList.isEmpty) {
          //       Fluttertoast.showToast(msg: "Not matched");
          //     }
          //   } else {
          //     arrTempNutritonList.addAll(arrNutritonList);
          //   }
          // }
          return Scaffold(
            backgroundColor: Color(0xff454283),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => ImageUploads()));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddandEditScreen()));
              },
              backgroundColor: Color(0xff454283),
              child: Icon(
                Icons.add,
                color: Colors.white,
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
                                child:
                                Image.asset("assets/Images/Vector.png"))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 15),
                              child: Text('Respacted Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19)),
                            ),
                            Container(
                              height: 37,
                              margin: EdgeInsets.only(
                                  top: 15,
                                  left: 10,
                                  bottom: 15,
                                  right: MediaQuery.of(context).size.height *
                                      0.09),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: TextField(
                                onChanged: (value) {
                                  searchfunction(value);
                                },
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
                          // itemCount: storedocs.length,
                          itemCount: displaylist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                  shareApp();
                                // for (var i = 0; i < storedocs.length; i++)
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => StudentDetilas(storedocs: displaylist)));
                              },
                              child: Slidable(
                                startActionPane: ActionPane(
                                  motion: const BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        _makingPhoneCall(displaylist[index]['number'],);
                                      },
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
                                      onPressed: (context) {

                                        // _onShare(context);
                                        // Fluttertoast.showToast(msg: 'share');
                                                },
                                      backgroundColor: Colors.orange,
                                      icon: Icons.share,
                                      label: 'Share',
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => StudentDetilas(storedocs: displaylist,index:index)));
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                          // color: Colors.green,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 5),
                                              Center(child: ClipOval(
                                                // displaylist[index]['name'],
                                                child: displaylist[index]["sgimage"] != null && displaylist[index]["sgimage"].isNotEmpty
                                                    ? Image.network(
                                                  displaylist[index]["sgimage"],
                                                  width: 75,
                                                  height: 75,
                                                  fit: BoxFit.cover,
                                                )
                                                    : Placeholder(
                                                  // Placeholder or any other widget to display when sgimage is null or empty
                                                  fallbackHeight: 75,
                                                  fallbackWidth: 75,
                                                ),

                                                // child: Image.network(displaylist[index]["sgimage"],width: 75,height: 75,fit: BoxFit.cover),
                                                      // child: Image.asset('assets/Images/userimg.png',width: 75,height: 75,fit: BoxFit.cover,),
                                                    // child: FutureBuilder(
                                                    //   future: _loadImages(),
                                                    //   builder: (context,
                                                    //       AsyncSnapshot<
                                                    //           List<
                                                    //               Map<String,
                                                    //                   dynamic>>>
                                                    //       snapshot) {
                                                    //     if (snapshot
                                                    //         .connectionState ==
                                                    //         ConnectionState.done) {
                                                    //       List<Map<String, dynamic>>
                                                    //       images =
                                                    //           snapshot.data ?? [];
                                                    //       if (images.isNotEmpty) {
                                                    //         Map<String, dynamic>
                                                    //         image = images[index]; // Accessing the first image in the array
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
                                                    //     return const Center(
                                                    //       child:
                                                    //       CircularProgressIndicator(),
                                                    //     );
                                                    //   },
                                                    // ),
                                                  )),
                                              SizedBox(height: 5),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)),
                                                      color: Colors.green),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text("Addmision"),
                                                  )),
                                              SizedBox(height: 5),
                                              // Container(
                                              //     margin: EdgeInsets.only(
                                              //         left: 10, right: 10),
                                              //     decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius.all(
                                              //                 Radius.circular(
                                              //                     10)),
                                              //         color: Colors.green),
                                              //     child: Padding(
                                              //       padding:
                                              //           const EdgeInsets.all(8.0),
                                              //       child: InkWell(
                                              //           onTap: () {
                                              //             deleteFile();
                                              //           },
                                              //           child: Text("delete")),
                                              //     )),
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
                                                      alignment:
                                                      Alignment.topRight,
                                                      child: Card(
                                                          margin: EdgeInsets.only(
                                                              top: 25, right: 10),
                                                          elevation: 11,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  30))),
                                                          child: IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                  CupertinoIcons
                                                                      .phone_arrow_down_left))),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      Alignment.topRight,
                                                      child: Card(
                                                          margin: EdgeInsets.only(
                                                              right: 10,
                                                              bottom: 10,
                                                              top: 5),
                                                          elevation: 11,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
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
                                                      Text(
                                                          displaylist[index]['name'],
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Phone no:',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff666565),
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                              storedocs[index]
                                                              ['number'],
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff454283),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 15)),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Branch :',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff666565),
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                              displaylist[index]
                                                              ['branch'],
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff454283),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 15),
                                                              maxLines: 1),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Sem :',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff666565),
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                              displaylist[index]['sem'],
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff454283),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 15),
                                                              maxLines: 1),
                                                          SizedBox(width: 5),
                                                          Text('Year:',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff666565),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 15)),
                                                          SizedBox(width: 5),
                                                          Text(
                                                              displaylist[index]
                                                              ['year'],
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff454283),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 15),
                                                              maxLines: 1),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        displaylist[index]
                                                        ['clg/uni'
                                                            ''],
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xff454283),
                                                          fontWeight:
                                                          FontWeight.bold,
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
        });
  }
  _makingPhoneCall(displaylist) async {
    var url = Uri.parse("tel:$displaylist");
    // var url = Uri.parse("tel:7622953838");
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> shareApp() async {
     final String appLink = 'https://play.google.com/store/apps/details?id=com.example.myapp';
    final String message = 'it is app link: $appLink';
    await (title: 'text', text: message, linkUrl: appLink);
  }
   // void _onShare(BuildContext context) async {
   //   final box = context.findRenderObject() as RenderBox?;
  //   await Share.share(text,subject: link,
  //       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  //
  // }
}