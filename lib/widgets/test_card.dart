import 'package:flutter/cupertino.dart';
import '../models/practice_test.dart';
import '../models/test_status.dart';
import '../core/theme.dart';

class TestCard extends StatelessWidget {
  final PracticeTest test;

  const TestCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(test.status);
    final icon = _getStatusIcon(test.status);

    return CupertinoListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color.withAlpha(26), // Replaces withOpacity(0.1)
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),

      title: Text(
        test.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${test.questions} questions • ${test.duration} min',
            style: TextStyle(
              color: CupertinoColors.secondaryLabel,
              fontSize: 14,
            ),
          ),
          if (test.score != null) ...[
            const SizedBox(height: 4),
            Text(
              'Score: ${test.score}%',
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ],
        ],
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        size: 16,
        color: CupertinoColors.secondaryLabel,
      ),
      onTap: () {
        // Handle test selection or navigation
      },
    );
  }

  Color _getStatusColor(TestStatus status) {
    switch (status) {
      case TestStatus.completed:
        return AppTheme.secondaryColor;
      case TestStatus.inProgress:
        return AppTheme.accentColor;
      case TestStatus.locked:
        return CupertinoColors.systemGrey;
      case TestStatus.available:
        return AppTheme.primaryColor;
    }
  }

  IconData _getStatusIcon(TestStatus status) {
    switch (status) {
      case TestStatus.completed:
        return CupertinoIcons.checkmark_alt_circle;
      case TestStatus.inProgress:
        return CupertinoIcons.play_circle;
      case TestStatus.locked:
        return CupertinoIcons.lock;
      case TestStatus.available:
        return CupertinoIcons.play;
    }
  }
}
