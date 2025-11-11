import 'models/exam.dart';

List<Exam> getExams() {
  return [
    // sledni ispiti
    Exam(
      subject: 'Мобилни информациски системи',
      dateTime: DateTime(2025, 12, 15, 10, 0),
      rooms: ['Амфитеатар 1', 'Амфитеатар 2'],
    ),
    Exam(
      subject: 'Оперативни системи',
      dateTime: DateTime(2025, 12, 18, 12, 0),
      rooms: ['Лабораторија 1'],
    ),
    Exam(
      subject: 'Веб програмирање',
      dateTime: DateTime(2025, 12, 22, 9, 0),
      rooms: ['Амфитеатар 3', 'Лабораторија 2'],
    ),
    Exam(
      subject: 'Бази на податоци',
      dateTime: DateTime(2025, 12, 25, 14, 0),
      rooms: ['Лабораторија 3', 'Лабораторија 4'],
    ),
    Exam(
      subject: 'Алгоритми и податочни структури',
      dateTime: DateTime(2026, 1, 10, 10, 30),
      rooms: ['Амфитеатар 1'],
    ),
    
    // zavrseni ispiti
    Exam(
      subject: 'Програмирање',
      dateTime: DateTime(2024, 6, 10, 10, 0),
      rooms: ['Амфитеатар 1'],
    ),
    Exam(
      subject: 'Компјутерски мрежи',
      dateTime: DateTime(2024, 9, 5, 11, 0),
      rooms: ['Лабораторија 1', 'Лабораторија 2'],
    ),
    Exam(
      subject: 'Вештачка интелигенција',
      dateTime: DateTime(2024, 9, 8, 13, 0),
      rooms: ['Амфитеатар 2'],
    ),
    Exam(
      subject: 'Софтверско инженерство',
      dateTime: DateTime(2024, 10, 12, 9, 30),
      rooms: ['Амфитеатар 3', 'Лабораторија 3'],
    ),
    Exam(
      subject: 'Дискретна математика',
      dateTime: DateTime(2024, 10, 15, 15, 0),
      rooms: ['Амфитеатар 1', 'Амфитеатар 2'],
    ),
    Exam(
      subject: 'Компјутерска графика',
      dateTime: DateTime(2024, 10, 19, 10, 0),
      rooms: ['Лабораторија 4'],
    ),
    Exam(
      subject: 'Информатичка безбедност',
      dateTime: DateTime(2024, 10, 22, 12, 30),
      rooms: ['Амфитеатар 2', 'Лабораторија 1'],
    ),
  ];
}