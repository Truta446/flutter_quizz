import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  late final int score;
  late final int qtyRightAnsewrs;

  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
    this.qtyRightAnsewrs = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
      'qtyRightAnsewrs': qtyRightAnsewrs,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
      qtyRightAnsewrs: map['qtyRightAnsewrs'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
