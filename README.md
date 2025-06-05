# AIUB CGPA Calculator

![App Screenshot](Screenshot from 2025-06-05 19-12-21.png)

A Flutter application designed specifically for American International University-Bangladesh (AIUB) students to calculate their semester GPA and cumulative CGPA.

## Features

- 📊 Calculate semester GPA and overall CGPA
- ➕ Add multiple subjects per semester
- ➕ Add unlimited semesters
- 📈 Automatic GPA calculation based on AIUB grading system
- 📱 Clean, intuitive interface
- 🔄 Real-time updates as you input grades

## Screenshots

| Initial State | Single Semester | Multiple Semesters |
|--------------|-----------------|--------------------|
| ![Screenshot from 2025-06-05 19-18-35](https://github.com/user-attachments/assets/7ba3d0cc-a010-4902-a62c-4fa04df4b0ae) |  ![Screenshot from 2025-06-05 19-12-13](https://github.com/user-attachments/assets/9923f97a-243d-41d0-a972-8d34b54ed760) | ![Screenshot from 2025-06-05 19-12-21](https://github.com/user-attachments/assets/eeafeb76-7721-4d0d-997b-15dff7a4cd70) |

## AIUB Grading System Reference

| Marks Range | Letter Grade | Grade Point |
|------------|-------------|------------|
| 90-100     | A+          | 4.00       |
| 85-89      | A           | 3.75       |
| 80-84      | B+          | 3.50       |
| 75-79      | B           | 3.25       |
| 70-74      | C+          | 3.00       |
| 65-69      | C           | 2.75       |
| 60-64      | D+          | 2.50       |
| 50-59      | D           | 2.25       |
| Below 50   | F           | 0.00       |

## How to Use

1. **Add Subjects**:
   - Tap "Add Subject" to add a new course
   - Enter subject name, marks obtained, and credits
   - The grade and grade points will be calculated automatically

2. **Add Semesters**:
   - Tap "Add Next Semester" to start a new semester
   - Add subjects to the new semester

3. **View Results**:
   - Semester GPA updates automatically
   - Overall CGPA is calculated across all semesters

## Installation

```bash
# Clone the repository
git clone https://github.com/mehnafiz/auto_cgpa_calculator.git

# Navigate to project directory
cd auto_cgpa_calculator

# Install dependencies
flutter pub get

# Run the app
flutter run
