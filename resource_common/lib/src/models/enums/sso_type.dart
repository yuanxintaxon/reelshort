import 'package:flutter/foundation.dart';

enum SSOType {
  GOOGLE,
  APPLE,
  FACEBOOK;

  String toJson() => name;
  static SSOType fromJson(String json) => values.byName(json);
}

extension SSOTypeExtension on SSOType {
  String get name => describeEnum(this);
  String get string {
    switch (this) {
      case SSOType.GOOGLE:
        return 'google';
      case SSOType.APPLE:
        return 'apple';
      case SSOType.FACEBOOK:
        return 'facebook';
    }
  }
}
