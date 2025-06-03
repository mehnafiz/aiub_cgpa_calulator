import 'subject.dart';

class Semester {
  final List<Subject> subjects;

  Semester({this.subjects = const []});

  double getGPA() {
    if (subjects.isEmpty) return 0.0;
    double totalPoints = 0.0;
    double totalCredits = 0.0;
    for (var subject in subjects) {
      totalPoints += subject.gradePoint * subject.credit;
      totalCredits += subject.credit;
    }
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }
}