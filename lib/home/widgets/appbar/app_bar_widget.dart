import 'package:flutter/material.dart';
import 'package:flutter_quizz/core/app_gradients.dart';
import 'package:flutter_quizz/core/app_text_styles.dart';
import 'package:flutter_quizz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter_quizz/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: FutureBuilder<int>(
                    future: getQtyAnswersRight(),
                    builder: (context, snapshot) {
                      return ScoreCardWidget(
                        percent: snapshot.data! / user.qtyRightAnsewrs,
                        key: UniqueKey(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );

  static Future<int> getQtyAnswersRight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int qtyAnswersRightFlutter = prefs.getInt('qtyAnswersRightFlutter') ?? 0;
    int qtyAnswersRightAngular = prefs.getInt('qtyAnswersRightAngular') ?? 0;
    int qtyAnswersRightData = prefs.getInt('qtyAnswersRightData') ?? 0;
    int qtyAnswersRightLogic = prefs.getInt('qtyAnswersRightLogic') ?? 0;
    return qtyAnswersRightFlutter +
        qtyAnswersRightAngular +
        qtyAnswersRightData +
        qtyAnswersRightLogic;
  }
}
