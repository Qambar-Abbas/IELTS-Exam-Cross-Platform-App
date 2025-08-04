import 'package:flutter/cupertino.dart';
import 'core/theme.dart';
import 'screens/main_screen.dart';

void main() => runApp(ExamApp());

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'IELTS Prep',
      theme: AppTheme.cupertinoTheme,
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
