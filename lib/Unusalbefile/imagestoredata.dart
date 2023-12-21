import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDetailsPage extends StatelessWidget {
  final String studentId;

  const StudentDetailsPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('demo')
            .doc(studentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final studentData = snapshot.data!.data() as Map<String, dynamic>?;
          if (studentData == null) {
            return const Center(
              child: Text('Student data not found.'),
            );
          }

          final imageUrl = studentData['image_url'];

          return Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Student Name: ${studentData['name']}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: ${studentData['age']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              imageUrl != null
                  ? Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
