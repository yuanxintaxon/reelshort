// To parse this JSON data, do
//
//     final languageOption = languageOptionFromJson(jsonString);

import 'dart:convert';

LanguageOption languageOptionFromJson(String str) =>
    LanguageOption.fromJson(json.decode(str));

String languageOptionToJson(LanguageOption data) => json.encode(data.toJson());

class LanguageOption {
  int id;
  String representativeCode;
  String displayName;

  LanguageOption({
    required this.id,
    required this.representativeCode,
    required this.displayName,
  });

  factory LanguageOption.fromJson(Map<String, dynamic> json) => LanguageOption(
        id: json["id"],
        representativeCode: json["representativeCode"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "representativeCode": representativeCode,
        "displayName": displayName,
      };
}
