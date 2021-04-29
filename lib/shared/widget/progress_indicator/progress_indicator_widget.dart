import 'package:flutter/material.dart';
import 'package:flutter_quizz/core/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 3,
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(
        AppColors.chartPrimary,
      ),
    );
  }
}
