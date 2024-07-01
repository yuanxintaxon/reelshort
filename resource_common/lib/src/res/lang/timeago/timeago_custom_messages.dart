import 'package:sprintf/sprintf.dart';
import 'package:timeago/src/messages/lookupmessages.dart';

import '../../../../resource_common.dart';

/// Chinese-China messages
class TimeagoCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => StrRes.timeagoSdkPrefixAgo;
  @override
  String prefixFromNow() => StrRes.timeagoSdkPrefixFromNow;
  @override
  String suffixAgo() => StrRes.timeagoSdkSuffixAgo;
  @override
  String suffixFromNow() => StrRes.timeagoSdkSuffixFromNow;
  @override
  String lessThanOneMinute(int seconds) => StrRes.timeagoSdkLessThanOneMinute;
  @override
  String aboutAMinute(int minutes) => StrRes.timeagoSdkAboutAMinute;
  @override
  String minutes(int minutes) => sprintf(StrRes.timeagoSdkMinutes, [minutes]);
  @override
  String aboutAnHour(int minutes) => StrRes.timeagoSdkAboutAnHour;
  @override
  String hours(int hours) => sprintf(StrRes.timeagoSdkHours, [hours]);
  @override
  String aDay(int hours) => StrRes.timeagoSdkADay;
  @override
  String days(int days) => sprintf(StrRes.timeagoSdkDays, [days]);
  @override
  String aboutAMonth(int days) => StrRes.timeagoSdkAboutAMonth;
  @override
  String months(int months) => sprintf(StrRes.timeagoSdkMonths, [months]);
  @override
  String aboutAYear(int year) => StrRes.timeagoSdkAboutAYear;
  @override
  String years(int years) => sprintf(StrRes.timeagoSdkYears, [years]);
  @override
  String wordSeparator() => StrRes.timeagoSdkWordSeparator;
}
