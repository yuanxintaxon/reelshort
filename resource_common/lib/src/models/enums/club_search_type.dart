import 'package:flutter/foundation.dart';

enum ClubSearchType {
  ACTIVE,
  NEW,
  TOP,
  CARE; // for carechat function

  String toJson() => name;
  static ClubSearchType fromJson(String json) => values.byName(json);
}

extension ClubSearchTypeExtension on ClubSearchType {
  String get name => describeEnum(this);
  String get string {
    switch (this) {
      case ClubSearchType.ACTIVE:
        return 'active';
      case ClubSearchType.NEW:
        return 'new';
      case ClubSearchType.TOP:
        return 'top';
      case ClubSearchType.CARE: // fore carechat function
        return 'care';
    }
  }
}
