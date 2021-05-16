import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtyAnswersRightFlutter = 0;
  int qtyAnswersRightAngular = 0;
  int qtyAnswersRightLogic = 0;
  int qtyAnswersRightData = 0;
}
