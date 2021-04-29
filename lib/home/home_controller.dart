import 'package:flutter/material.dart';
import 'package:flutter_quizz/core/app_images.dart';
import 'package:flutter_quizz/home/home_repository.dart';
import 'package:flutter_quizz/home/home_state.dart';
import 'package:flutter_quizz/shared/models/answer_model.dart';
import 'package:flutter_quizz/shared/models/question_model.dart';
import 'package:flutter_quizz/shared/models/quiz_model.dart';
import 'package:flutter_quizz/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }
}
