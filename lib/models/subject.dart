import '../utils/grade_converter.dart';

class Subject {
  String name;
  String grade;
  double credit;
  double mark;

  Subject({
    this.name = '',
    this.grade = '',
    this.credit = 3.0,
    this.mark = -1,
  });

  double get gradePoint => GradeConverter.getGradePoint(grade);
}
