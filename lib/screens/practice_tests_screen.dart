import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/exam_section.dart';
import '../models/practice_test.dart';
import '../models/test_status.dart';
import '../widgets/test_card.dart';

class PracticeTestsScreen extends StatelessWidget {
  final ExamSection section;

  const PracticeTestsScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final tests = _generatePracticeTests(section.title);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSectionHeader(),
              const SizedBox(height: 24),
              _buildProgressCard(),
              const SizedBox(height: 24),
              Text(
                'Practice Tests',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TestCard(test: tests[i]),
              ),
              childCount: tests.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: section.color.withAlpha((0.1 * 255).round()),
            shape: BoxShape.circle,
          ),
          child: Icon(section.icon, color: section.color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                section.description,
                style: TextStyle(color: CupertinoColors.secondaryLabel),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Progress',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '68%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: section.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.68,
              backgroundColor: CupertinoColors.systemGrey5,
              valueColor: AlwaysStoppedAnimation<Color>(section.color),
            ),
            const SizedBox(height: 12),
            Text(
              '12 of 18 tests completed',
              style: TextStyle(color: CupertinoColors.secondaryLabel),
            ),
          ],
        ),
      ),
    );
  }

  List<PracticeTest> _generatePracticeTests(String title) {
    final List<String> testNames = [
      'Basic Level Test',
      'Intermediate Practice',
      'Advanced Challenge',
      'Mock Exam 1',
      'Mock Exam 2',
      'Diagnostic Test',
      'Speed Test',
      'Comprehensive Review',
      'Final Practice',
    ];

    return testNames.asMap().entries.map((entry) {
      final index = entry.key;
      final name = entry.value;

      TestStatus status;
      int? score;

      if (index < 4) {
        status = TestStatus.completed;
        score = 75 + (index * 5); // e.g., 75, 80, 85, 90
      } else if (index == 4) {
        status = TestStatus.inProgress;
      } else if (index > 6) {
        status = TestStatus.locked;
      } else {
        status = TestStatus.available;
      }

      return PracticeTest(
        title: '$title - $name',
        questions: 20 + (index * 5),
        duration: 30 + (index * 10),
        status: status,
        score: score,
      );
    }).toList();
  }
}
