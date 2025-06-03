import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../models/semester.dart';
import 'subject_row.dart';

class SemesterCard extends StatefulWidget {
  final String title;
  final Semester semester;
  final VoidCallback onDelete;

  const SemesterCard({
    super.key,
    required this.title,
    required this.semester,
    required this.onDelete,
  });

  @override
  State<SemesterCard> createState() => _SemesterCardState();
}

class _SemesterCardState extends State<SemesterCard> {
  List<Subject> subjects = [];

  @override
  void initState() {
    super.initState();
    subjects = List.from(widget.semester.subjects);
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    double gpa = Semester(subjects: subjects).getGPA();

    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Column(
              children: [
                for (var subject in subjects)
                  SubjectRow(
                    subject: subject,
                    onDelete: () {
                      setState(() {
                        subjects.remove(subject);
                      });
                    },
                    onChanged: update,
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Semester GPA: ${gpa.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() => subjects.add(Subject()));
              },
              child: const Text("Add Subject"),
            ),
          ],
        ),
      ),
    );
  }
}