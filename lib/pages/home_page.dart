import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Student> students;
  final Function(Student) onAddStudent;
  final Function(Student) onDeleteStudent;

  HomePage({required this.students, required this.onAddStudent, required this.onDeleteStudent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,  // AppBar stylisée
        title: Text('Liste des Étudiants'),
      ),
      body: students.isEmpty
          ? Center(child: Text('Aucun étudiant enregistré', style: TextStyle(fontSize: 18, color: Colors.grey)))
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailPage(
                    student: student,
                    onDelete: onDeleteStudent,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.teal),
                  title: Text('${student.firstName} ${student.lastName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/studentForm');
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
    );
  }
}