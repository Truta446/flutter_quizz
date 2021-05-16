import 'package:flutter/material.dart';
import 'package:flutter_quizz/core/app_text_styles.dart';
import 'package:flutter_quizz/home/widgets/chart/chart_widget.dart';
import 'package:flutter_quizz/core/app_colors.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  String get title {
    if (this.percent == 0)
      return 'Vamos começar';
    else if (this.percent == 1)
      return 'Parabéns';
    else
      return 'Bom resultado';
  }

  String get subtitle {
    if (this.percent == 0)
      return 'Complete os desafios e avance em conhecimento.';
    else if (this.percent == 1)
      return 'Você conseguiu completar todos os desafios.';
    else
      return 'Seu conhecimento está sendo aprimorado :)';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(
                  percent: percent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        subtitle,
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
