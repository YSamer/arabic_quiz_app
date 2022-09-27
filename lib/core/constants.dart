import 'package:arabic_quiz_app/models/quistions.dart';

class AppConstants {
  int _currentQuestion = 0;
  final List<Question> _questions = [
    Question(
      questionText: '1 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-1.jpg',
      answer: true,
    ),
    Question(
      questionText: '2 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-2.jpg',
      answer: true,
    ),
    Question(
      questionText: '3 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-3.jpg',
      answer: false,
    ),
    Question(
      questionText: '4 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-4.jpg',
      answer: false,
    ),
    Question(
      questionText: '5 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-5.jpg',
      answer: true,
    ),
    Question(
      questionText: '6 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-6.jpg',
      answer: false,
    ),
    Question(
      questionText: '7 كم عدد كواكب المجموعة الشمسية',
      questionImage: 'images/image-7.jpg',
      answer: true,
    ),
  ];

  int get questionLength => _questions.length;

  bool get isFinished {
    if (_currentQuestion < AppConstants().questionLength - 1) {
      _currentQuestion++;
      return false;
    }
    return true;
  }

  void reset() {
    _currentQuestion = 0;
  }

  bool questionAnswer() {
    return _questions[_currentQuestion].answer;
  }

  String questionText() {
    return _questions[_currentQuestion].questionText;
  }

  String questionImage() {
    return _questions[_currentQuestion].questionImage;
  }
}
