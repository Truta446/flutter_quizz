import 'package:flutter/material.dart';
import 'package:flutter_quizz/challenge/challenge_page.dart';
import 'package:flutter_quizz/core/app_colors.dart';
import 'package:flutter_quizz/home/home_controller.dart';
import 'package:flutter_quizz/home/home_state.dart';
import 'package:flutter_quizz/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_quizz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_quizz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  Future<int> getQtyAnswersRightFlutter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int qtyAnswersRightFlutter = prefs.getInt('qtyAnswersRightFlutter') ?? 0;
    return qtyAnswersRightFlutter;
  }

  Future<int> getQtyAnswersRightAngular() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int qtyAnswersRightAngular = prefs.getInt('qtyAnswersRightAngular') ?? 0;
    return qtyAnswersRightAngular;
  }

  Future<int> getQtyAnswersRightLogic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int qtyAnswersRightLogic = prefs.getInt('qtyAnswersRightLogic') ?? 0;
    return qtyAnswersRightLogic;
  }

  Future<int> getQtyAnswersRightData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int qtyAnswersRightData = prefs.getInt('qtyAnswersRightData') ?? 0;
    return qtyAnswersRightData;
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: [
                    FutureBuilder<int>(
                      future: getQtyAnswersRightFlutter(),
                      builder: (context, snapshot) {
                        return QuizCardWidget(
                          percent: snapshot.data! /
                              controller.quizzes![0].questions.length,
                          title: controller.quizzes![0].title,
                          image: controller.quizzes![0].image,
                          completed:
                              "${snapshot.data!}/${controller.quizzes![0].questions.length}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChallengePage(
                                  questions: controller.quizzes![0].questions,
                                  title: controller.quizzes![0].title,
                                ),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        );
                      },
                    ),
                    FutureBuilder<int>(
                      future: getQtyAnswersRightAngular(),
                      builder: (context, snapshot) {
                        return QuizCardWidget(
                          percent: snapshot.data! /
                              controller.quizzes![1].questions.length,
                          title: controller.quizzes![1].title,
                          image: controller.quizzes![1].image,
                          completed:
                              "${snapshot.data!}/${controller.quizzes![1].questions.length}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChallengePage(
                                  questions: controller.quizzes![1].questions,
                                  title: controller.quizzes![1].title,
                                ),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        );
                      },
                    ),
                    FutureBuilder<int>(
                      future: getQtyAnswersRightLogic(),
                      builder: (context, snapshot) {
                        return QuizCardWidget(
                          percent: snapshot.data! /
                              controller.quizzes![2].questions.length,
                          title: controller.quizzes![2].title,
                          image: controller.quizzes![2].image,
                          completed:
                              "${snapshot.data!}/${controller.quizzes![2].questions.length}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChallengePage(
                                  questions: controller.quizzes![2].questions,
                                  title: controller.quizzes![2].title,
                                ),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        );
                      },
                    ),
                    FutureBuilder<int>(
                      future: getQtyAnswersRightData(),
                      builder: (context, snapshot) {
                        return QuizCardWidget(
                          percent: snapshot.data! /
                              controller.quizzes![3].questions.length,
                          title: controller.quizzes![3].title,
                          image: controller.quizzes![3].image,
                          completed:
                              "${snapshot.data!}/${controller.quizzes![3].questions.length}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChallengePage(
                                  questions: controller.quizzes![3].questions,
                                  title: controller.quizzes![3].title,
                                ),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
