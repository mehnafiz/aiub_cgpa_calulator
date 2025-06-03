import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../utils/grade_converter.dart';

class SubjectRow extends StatelessWidget {
  final Subject subject;
  final VoidCallback onDelete;
  final VoidCallback onChanged;

  const SubjectRow({
    super.key,
    required this.subject,
    required this.onDelete,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: const InputDecoration(labelText: 'Subject Name' , labelStyle: TextStyle(fontSize: 20)),
            onChanged: (val) {
              subject.name = val;
              onChanged();
            },
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Marks', labelStyle: TextStyle(fontSize: 20)),
            onChanged: (val) {
              final mark = double.tryParse(val);
              if (mark != null && mark >= 0 && mark <= 100) {
                subject.mark = mark;
                subject.grade = GradeConverter.getLetterGrade(mark);
              } else {
                subject.grade = 'F';
              }
              onChanged();
            },
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          flex: 1,
          child: InputDecorator(
            decoration: const InputDecoration(labelText: 'Grade', labelStyle: TextStyle(fontSize: 20)),
            child: Text(subject.grade),
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Credits', labelStyle: TextStyle(fontSize: 20)),
            onChanged: (val) {
              subject.credit = double.tryParse(val) ?? 0.0;
              onChanged();
            },
          ),
        ),

        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
