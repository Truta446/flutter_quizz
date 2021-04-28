import 'package:flutter/material.dart';
import 'package:flutter_quizz/core/app_gradients.dart';
import 'package:flutter_quizz/core/app_text_styles.dart';
import 'package:flutter_quizz/home/widgets/score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
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
                              text: "Juan",
                              style: AppTextStyles.title,
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
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/30662756?s=400&u=1a88b701f7703fb8c54e0fd3beb0c61cdef3eeab&v=4"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(),
                ),
              ],
            ),
          ),
        );
}
