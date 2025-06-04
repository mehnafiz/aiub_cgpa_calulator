import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../models/semester.dart';
import 'subject_row.dart';

class SemesterCard extends StatefulWidget {
  final String title;
  final Semester semester;
  final VoidCallback onDelete;
  final ValueChanged<Semester> onSemesterUpdated;

  const SemesterCard({
    super.key,
    required this.title,
    required this.semester,
    required this.onDelete,
    required this.onSemesterUpdated,
  });

  @override
  State<SemesterCard> createState() => _SemesterCardState();
}

class _SemesterCardState extends State<SemesterCard> {
  late List<Subject> subjects;

  @override
  void initState() {
    super.initState();
    subjects = List.from(widget.semester.subjects);
  }

  void _updateParent() {
    widget.onSemesterUpdated(Semester(subjects: List.from(subjects)));
  }

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
                Text(widget.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    key: ValueKey(subject.hashCode),
                    subject: subject,
                    onDelete: () {
                      setState(() {
                        subjects.remove(subject);
                        _updateParent();
                      });
                    },
                    onChanged: _updateParent,
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text("Semester GPA: ${gpa.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  subjects.add(Subject());
                  _updateParent();
                });
              },
              child: const Text("Add Subject"),
            ),
          ],
        ),
      ),
    );
  }
}