import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:resource_common/resource_common.dart';

class AppController extends GetxController {
  final languageMap = TranslationService.languages;

  var isRunningBackground = false;
  final initializedSubject = PublishSubject<bool>();

  late BaseDeviceInfo deviceInfo;

  /// discoverPageURL
  /// ordinaryUserAddFriend,
  /// bossUserID,
  /// adminURL ,
  /// allowSendMsgNotFriend
  /// needInvitationCodeRegister
  /// robots
  final clientConfigMap = <String, dynamic>{}.obs;

  Future<void> runningBackground(bool run) async {
    Logger.print('-----App running background : $run-------------');

    if (isRunningBackground && !run) {}
    isRunningBackground = run;
    if (!run) {}
  }

  void _initAppDataFromServer() async {
    try {
      await Future.wait([]);
    } catch (e) {
      Logger.print("creturn app controller initialization error $e");
    } finally {
      initializedSubject.sink.add(true);
    }
  }

  @override
  void onClose() {
    initializedSubject.close();
    super.onClose();
  }

  Locale? getLocale() {
    return IMUtils.geAppElseDeviceLocale();
  }

  @override
  void onReady() {
    // _initAppDataFromServer();
    _getDeviceInfo();

    super.onReady();
  }

  void _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    deviceInfo = await deviceInfoPlugin.deviceInfo;
  }
}
