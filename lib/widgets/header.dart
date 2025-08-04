import 'package:flutter/cupertino.dart';
import '../core/theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back!',
          style: TextStyle(fontSize: 16, color: CupertinoColors.secondaryLabel),
        ),
        const SizedBox(height: 8),
        Text(
          'IELTS PREP',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        _NextExamCard(),
      ],
    );
  }
}

class _NextExamCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.primaryColor.withAlpha((0.2 * 255).round()),
        ),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.book, color: AppTheme.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Your next exam is in 15 days. Keep practicing!',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
