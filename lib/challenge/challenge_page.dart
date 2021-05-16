import 'package:flutter/material.dart';
import 'package:flutter_quizz/challenge/challenge_controller.dart';
import 'package:flutter_quizz/challenge/widget/next_button/next_button_widget.dart';
import 'package:flutter_quizz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:flutter_quizz/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter_quizz/result/result_page.dart';
import 'package:flutter_quizz/shared/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) async {
    if (value) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (widget.title == 'Flutter') {
        controller.qtyAnswersRightFlutter++;
        prefs.setInt(
            'qtyAnswersRightFlutter', controller.qtyAnswersRightFlutter);
      } else if (widget.title == 'Angular') {
        controller.qtyAnswersRightAngular++;
        prefs.setInt(
            'qtyAnswersRightAngular', controller.qtyAnswersRightAngular);
      } else if (widget.title == 'Estrutura de dados') {
        controller.qtyAnswersRightData++;
        prefs.setInt('qtyAnswersRightData', controller.qtyAnswersRightData);
      } else {
        controller.qtyAnswersRightLogic++;
        prefs.setInt('qtyAnswersRightLogic', controller.qtyAnswersRightLogic);
      }
    }

    nextPage();
  }

  int get qtyAnswersRight {
    if (widget.title == 'Flutter') {
      return controller.qtyAnswersRightFlutter;
    } else if (widget.title == 'Angular') {
      return controller.qtyAnswersRightAngular;
    } else if (widget.title == 'Estrutura de dados') {
      return controller.qtyAnswersRightData;
    } else {
      return controller.qtyAnswersRightLogic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Confirmar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              length: widget.questions.length,
                              result: qtyAnswersRight,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
