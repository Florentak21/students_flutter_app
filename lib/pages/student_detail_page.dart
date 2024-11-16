import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentDetailPage extends StatelessWidget {
  final Student student;
  final Function(Student) onDelete;

  StudentDetailPage({required this.student, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('${student.firstName} ${student.lastName}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informations de l'étudiant
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.teal, size: 30),
                        SizedBox(width: 10),
                        Text('Nom: ${student.firstName}', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Colors.teal, size: 30),
                        SizedBox(width: 10),
                        Text('Prénom: ${student.lastName}', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.teal, size: 30),
                        SizedBox(width: 10),
                        Text('Email: ${student.email}', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Description Lorem ipsum
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia libero vel lorem fermentum, non sollicitudin mi suscipit. Sed sit amet velit a urna feugiat tincidunt non vel libero. Curabitur auctor erat non libero placerat tempor.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black45),
                ),
              ),
              SizedBox(height: 30),

              // Bouton de suppression de l'étudiant
              ElevatedButton(
                onPressed: () {
                  onDelete(student);
                  Navigator.pop(context);
                },
                child: Text('Supprimer cet étudiant'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.teal),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                  textStyle: WidgetStateProperty.all<TextStyle>(TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}