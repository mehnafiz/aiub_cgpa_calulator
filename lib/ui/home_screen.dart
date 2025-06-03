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
    double totalPoints = 0;
    double totalCredits = 0;

    for (var semester in semesters) {
      for (var subject in semester.subjects) {
        double points = subject.gradePoint * subject.credit;
        totalPoints += points;
        totalCredits += subject.credit;
      }
    }

    if (totalCredits == 0) return 0;
    return totalPoints / totalCredits;
  }


  @override
  Widget build(BuildContext context) {
    double cgpa = getCGPA();
    return Scaffold(
      appBar: AppBar(
        title: const Text("CGPA Calculator" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            child: Image.asset("assets/images/aiub_logo.png" , fit: BoxFit.cover),
          ),

        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < semesters.length; i++)
            SemesterCard(
              title: "Semester ${i + 1}",
              semester: semesters[i],
              onDelete: () {
                setState(() {
                  semesters.removeAt(i);
                });
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

              ],
            ),
          ),
        ],
      ),
    );
  }
}
