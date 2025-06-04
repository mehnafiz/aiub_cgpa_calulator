import 'package:flutter/material.dart';
import '../models/semester.dart';
import 'semester_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Semester> semesters = [Semester(subjects: [])];

  double getCGPA() {
    if (semesters.isEmpty) return 0.0;

    double totalGPA = 0.0;
    int semestersWithSubjects = 0;

    for (var semester in semesters) {
      final semesterGPA = semester.getGPA();
      if (semesterGPA > 0) {
        totalGPA += semesterGPA;
        semestersWithSubjects++;
      }
    }

    return semestersWithSubjects > 0 ? totalGPA / semestersWithSubjects : 0.0;
  }

  void _updateSemester(int index, Semester updatedSemester) {
    setState(() {
      semesters[index] = updatedSemester;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cgpa = getCGPA();
    return Scaffold(
      appBar: AppBar(
        title: const Text(" AIUB CGPA Calculator",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(2.0), // Reduced padding to give more space to the logo
          child: CircleAvatar(
            radius: 80, // Increased radius to make the avatar larger
            backgroundColor: Colors.transparent, // Optional: if you want no background color
            child: Image.asset("assets/images/aiub_logo.png", fit: BoxFit.cover),
          ),
        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < semesters.length; i++)
            SemesterCard(
              key: ValueKey(i), // Important for proper widget updates
              title: "Semester ${i + 1}",
              semester: semesters[i],
              onDelete: () {
                setState(() {
                  semesters.removeAt(i);
                });
              },
              onSemesterUpdated: (updatedSemester) {
                _updateSemester(i, updatedSemester);
              },
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      semesters.add(Semester(subjects: []));
                    });
                  },
                  child: const Text("Add Next Semester"),
                ),
                const SizedBox(height: 12),
                Text(
                  "Your CGPA: ${cgpa.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}