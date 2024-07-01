import 'package:flutter/foundation.dart';

enum WorldSearchType {
  CITY,
  ACTIVE,
  NEW,
  TRENDY;

  String toJson() => name;
  static WorldSearchType fromJson(String json) => values.byName(json);
}

extension WorldSearchTypeExtension on WorldSearchType {
  String get name => describeEnum(this);
  String get string {
    switch (this) {
      case WorldSearchType.CITY:
        return 'city';
      case WorldSearchType.ACTIVE:
        return 'active';
      case WorldSearchType.NEW:
        return 'new';
      case WorldSearchType.TRENDY:
        return 'trendy';
    }
  }
}
