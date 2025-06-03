class GradeConverter {
  static double getGradePoint(String grade) {
    switch (grade) {
      case 'A+': return 4.00;
      case 'A': return 3.75;
      case 'B+': return 3.50;
      case 'B': return 3.25;
      case 'C+': return 3.00;
      case 'C': return 2.75;
      case 'D+': return 2.50;
      case 'D': return 2.25;
      case 'F': return 0.00;
      case 'I':
      case 'W':
      case 'UW':
        return 0.0;
      default: return 0.0;
    }
  }

  static String getLetterGrade(double mark) {
    if (mark >= 90) return 'A+';
    if (mark >= 85) return 'A';
    if (mark >= 80) return 'B+';
    if (mark >= 75) return 'B';
    if (mark >= 70) return 'C+';
    if (mark >= 65) return 'C';
    if (mark >= 60) return 'D+';
    if (mark >= 50) return 'D';
    return 'F';
  }

}
