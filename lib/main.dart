import 'package:flutter/material.dart';
import 'models/student.dart';
import 'pages/student_form_page.dart';
import 'pages/student_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Désactive la debugbar
      title: 'Gestion des Étudiants',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [];

  void _addStudent(Student student) {
    setState(() {
      students.add(student);
    });
  }

  void _deleteStudent(Student student) {
    setState(() {
      students.remove(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,  // Couleur de fond de l'AppBar
        title: Text('Liste des Étudiants'),
      ),
      body: students.isEmpty
          ? Center(
              child: Text(
                'Aucun étudiant enregistré',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
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
                          onDelete: _deleteStudent,
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
                        title: Text(
                          '${student.firstName} ${student.lastName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentFormPage(
                onSubmit: _addStudent,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
    );
  }
}
