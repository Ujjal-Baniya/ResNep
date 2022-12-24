import 'package:http/http.dart';
import 'dart:convert';

class seeData {
  final String? sub;
  final String? credit_hours;
  final String? Theoritical;
  final String? practical;
  final String? final_grade;
  final String? grade_point;

  seeData({
    required this.sub,
    required this.credit_hours,
    required this.Theoritical,
    required this.practical,
    required this.final_grade,
    required this.grade_point,
  });

  factory seeData.fromJson(Map<String, dynamic> json) {
    return seeData(
      sub: json['sub'],
      credit_hours: json['credit_hours'],
      Theoritical: json['Theoritical'],
      practical: json['practical'],
      final_grade: json['final_grade'],
      grade_point: json['grade_point'],
    );
  }
}
