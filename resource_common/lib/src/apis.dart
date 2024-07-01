import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:resource_common/resource_common.dart';

class Apis {
  static Future<Options> get imTokenOptions async => Options(headers: {
        'token': await DataSp.imToken,
        'platform': IMUtils.getPlatform(),
      });

  static Future<Options> get chatTokenOptions async => Options(headers: {
        'token': await DataSp.chatToken,
        'platform': IMUtils.getPlatform(),
      });
  // static String get operationID =>
  //     DateTime.now().millisecondsSinceEpoch.toString();

  static Options get langOptions => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'platform': IMUtils.getPlatform(),
      });
  static Future<Options> get chatTokenAndlangOptions async => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'token': await DataSp.chatToken,
        'platform': IMUtils.getPlatform(),
      });
  static Future<Options> get imTokenAndlangOptions async => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'token': await DataSp.imToken,
        'platform': IMUtils.getPlatform(),
      });
}
