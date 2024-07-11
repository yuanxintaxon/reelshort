import 'dart:ui';
import 'package:get/get.dart';

import '../../resource_common.dart';
import 'lang/de_DE.dart';
import 'lang/en_US.dart';
import 'lang/es_ES.dart';
import 'lang/fr_FR.dart';
import 'lang/hi_IN.dart';
import 'lang/it_IT.dart';
import 'lang/ja_JP.dart';
import 'lang/ko_KR.dart';
import 'lang/pl_PL.dart';
import 'lang/pt_PT.dart';
import 'lang/ru_RU.dart';
import 'lang/tr_TR.dart';
import 'lang/vi_VN.dart';
import 'lang/zh_CN.dart';
import 'lang/zh_TW.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  /// Important: strictly follow the sequence index,
  /// serve as a reference for methods in other class and local storage
  static Map<String, LanguageOption> languages = {
    'en': LanguageOption(
      id: 1,
      representativeCode: 'en_US',
      displayName: 'English',
    ), // English
    'zh': LanguageOption(
      id: 2,
      representativeCode: 'zh_CN',
      displayName: '中文简体',
    ), // Chinese Simplified
    'tw': LanguageOption(
      id: 3,
      representativeCode: 'zh_TW',
      displayName: '繁体中文',
    ), // Chinese Traditional
    'es': LanguageOption(
      id: 4,
      representativeCode: 'es_ES',
      displayName: 'Español',
    ), // Spanish
    'pt': LanguageOption(
      id: 5,
      representativeCode: 'pt_PT',
      displayName: 'Português',
    ), // Portuguese
    'vn': LanguageOption(
      id: 6,
      representativeCode: 'vi_VN',
      displayName: 'Tiếng Việt',
    ), // Vietnamese
    'jp': LanguageOption(
      id: 7,
      representativeCode: 'ja_JP',
      displayName: '日本語',
    ), // Japanese
    'kr': LanguageOption(
      id: 8,
      representativeCode: 'ko_KR',
      displayName: '한국어',
    ), // Korean
    'fr': LanguageOption(
      id: 9,
      representativeCode: 'fr_FR',
      displayName: 'Français',
    ), // French
    'de': LanguageOption(
      id: 10,
      representativeCode: 'de_DE',
      displayName: 'Deutsch',
    ), // German
    'in': LanguageOption(
      id: 11,
      representativeCode: 'hi_IN',
      displayName: 'हिन्दी',
    ), // Hindi
    'it': LanguageOption(
      id: 12,
      representativeCode: 'it_IT',
      displayName: 'Italiano',
    ), // Italian
    'pl': LanguageOption(
      id: 13,
      representativeCode: 'pl_PL',
      displayName: 'Polski',
    ), // Polish
    'ru': LanguageOption(
      id: 14,
      representativeCode: 'ru_RU',
      displayName: 'русский (Слава Україні)',
    ), // Russian
    'tr': LanguageOption(
      id: 15,
      representativeCode: 'tr_TR',
      displayName: 'Türkçe',
    ), // Turkish
  };

  static Map<String, String> reverseLanguageKeys = {
    'en_US': 'en',
    'zh_CN': 'zh',
    'zh_TW': 'tw',
    'es_ES': 'es',
    'pt_PT': 'pt',
    'vi_VN': 'vn', // not in country pricker
    'ja_JP': 'jp', // not in country pricker
    'ko_KR': 'kr', // not in country pricker
    'fr_FR': 'fr',
    'de_DE': 'de',
    'hi_IN': 'in',
    'it_IT': 'it',
    'pl_PL': 'pl',
    'ru_RU': 'ru',
    'tr_TR': 'tr',
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
        'zh_TW': zh_TW,
        'es_ES': es_ES,
        'pt_PT': pt_PT,
        'vi_VN': vi_VN,
        'ja_JP': ja_JP,
        'ko_KR': ko_KR,
        'fr_FR': fr_FR,
        'de_DE': de_DE,
        'hi_IN': hi_IN,
        'it_IT': it_IT,
        'pl_PL': pl_PL,
        'ru_RU': ru_RU,
        'tr_TR': tr_TR,
      };
}

class StrRes {
  StrRes._();

  // common
  static String get home => 'home'.tr;

  static String get appIntroSubtitle => 'appIntroSubtitle'.tr;

  static String get copySuccessfully => 'copySuccessfully'.tr;

  static String get download => 'download'.tr;

  static String get yesterday => 'yesterday'.tr;

  static String get monday => 'monday'.tr;

  static String get tuesday => 'tuesday'.tr;

  static String get wednesday => 'wednesday'.tr;

  static String get thursday => 'thursday'.tr;

  static String get friday => 'friday'.tr;

  static String get saturday => 'saturday'.tr;

  static String get sunday => 'sunday'.tr;

  static String get day => 'day'.tr;

  static String get hour => 'hour'.tr;

  static String get hours => 'hours'.tr;

  static String get minute => 'minute'.tr;

  static String get seconds => 'seconds'.tr;

  static String get cancel => 'cancel'.tr;

  static String get determine => 'determine'.tr;

  static String get confirm => 'confirm'.tr;

  static String get acknowledged => 'acknowledged'.tr;

  static String get retry => 'retry'.tr;

  static String get next => 'next'.tr;

  static String get skip => 'skip'.tr;

  static String get finish => 'finish'.tr;

  static String get save => 'save'.tr;

  static String get saveSuccessfully => 'saveSuccessfully'.tr;

  static String get saveFailed => 'saveFailed'.tr;

  static String get search => 'search'.tr;

  static String get forgetPassword => 'forgetPassword'.tr;

  static String get sendVerificationCode => 'sendVerificationCode'.tr;

  static String get resendVerificationCode => 'resendVerificationCode'.tr;

  static String get verificationCodeTimingReminder =>
      'verificationCodeTimingReminder'.tr;

  static String get menuForward => 'menuForward'.tr;

  static String get toolboxAlbum => 'toolboxAlbum'.tr;

  static String get toolboxCamera => 'toolboxCamera'.tr;

  static String get currentNetworkNotAvailable =>
      'currentNetworkNotAvailable'.tr;

  /// sdk localisation pack
  static String get timeagoSdkPrefixAgo => 'timeagoSdkPrefixAgo'.tr;

  static String get timeagoSdkPrefixFromNow => 'timeagoSdkPrefixFromNow'.tr;

  static String get timeagoSdkSuffixAgo => 'timeagoSdkSuffixAgo'.tr;

  static String get timeagoSdkSuffixFromNow => 'timeagoSdkSuffixFromNow'.tr;

  static String get timeagoSdkLessThanOneMinute =>
      'timeagoSdkLessThanOneMinute'.tr;

  static String get timeagoSdkAboutAMinute => 'timeagoSdkAboutAMinute'.tr;

  static String get timeagoSdkMinutes => 'timeagoSdkMinutes'.tr;

  static String get timeagoSdkAboutAnHour => 'timeagoSdkAboutAnHour'.tr;

  static String get timeagoSdkHours => 'timeagoSdkHours'.tr;

  static String get timeagoSdkADay => 'timeagoSdkADay'.tr;

  static String get timeagoSdkDays => 'timeagoSdkDays'.tr;

  static String get timeagoSdkAboutAMonth => 'timeagoSdkAboutAMonth'.tr;

  static String get timeagoSdkMonths => 'timeagoSdkMonths'.tr;

  static String get timeagoSdkAboutAYear => 'timeagoSdkAboutAYear'.tr;

  static String get timeagoSdkYears => 'timeagoSdkYears'.tr;

  static String get timeagoSdkWordSeparator => 'timeagoSdkWordSeparator'.tr;

  /// new
  static String get reelShort => 'reelShort'.tr;

  static String get mostTrending => 'mostTrending'.tr;

  static String get continueWatching => 'continueWatching'.tr;

  static String get topPick => 'topPick'.tr;

  static String get newRelease => 'newRelease'.tr;

  static String get hiddenIdentity => 'hiddenIdentity'.tr;

  static String get loveAtFirstSight => 'loveAtFirstSight'.tr;

  static String get youngLove => 'youngLove'.tr;

  static String get toxicNTaboo => 'toxicNTaboo'.tr;

  static String get werewolfNVampire => 'werewolfNVampire'.tr;

  static String get asianStories => 'asianStories'.tr;

  static String get moreRecommended => 'moreRecommended'.tr;

  static String get slidToBottomHint => 'slidToBottomHint'.tr;

  static String get guest => 'guest'.tr;

  static String get uidLabel => 'uidLabel'.tr;

  static String get coins => 'coins'.tr;

  static String get bonus => 'bonus'.tr;

  static String get topUp => 'topUp'.tr;

  static String get myWallet => 'myWallet'.tr;

  static String get myListNHistory => 'myListNHistory'.tr;

  static String get feedback => 'feedback'.tr;

  static String get signIn => 'signIn'.tr;

  static String get logOut => 'logOut'.tr;

  static String get welcomeToX => 'welcomeToX'.tr;

  static String get signInWithX => 'signInWithX'.tr;

  static String get byContinuingIAgree => 'byContinuingIAgree'.tr;

  static String get serviceAgreement => 'serviceAgreement'.tr;

  static String get and => 'and'.tr;

  static String get privacyPolicy => 'privacyPolicy'.tr;

  static String get google => 'google'.tr;

  static String get facebook => 'facebook'.tr;

  static String get apple => 'apple'.tr;

  static String get twitter => 'twitter'.tr;

  static String get share => 'share'.tr;

  static String get link => 'link'.tr;

  static String get copiedLinkSuccessfully => 'copiedLinkSuccessfully'.tr;
}
