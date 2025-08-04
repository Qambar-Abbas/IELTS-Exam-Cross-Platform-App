import 'test_status.dart';

class PracticeTest {
  final String title;
  final int questions;
  final int duration;
  final TestStatus status;
  final int? score;

  PracticeTest({
    required this.title,
    required this.questions,
    required this.duration,
    required this.status,
    this.score,
  });
}
