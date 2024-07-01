import 'package:resource_common/resource_common.dart';
import 'package:sprintf/sprintf.dart';
import 'package:uuid/uuid.dart';

class DataSp {
  static const _loginCertificate = 'loginCertificate';
  static const _loginAccount = 'loginAccount';
  static const _server = "server";
  static const _ip = 'ip';
  static const _deviceID = 'deviceID';
  static const _ignoreUpdate = 'ignoreUpdate';
  static const _language = "%s_languageKey";
  static const _excludedCountryCodeForPhoneRegistration =
      "excludedCountryCodeForPhoneRegistration";
  static const _groupApplication = "%s_groupApplication";
  static const _friendApplication = "%s_friendApplication";
  static const _enabledVibration = 'enabledVibration';
  static const _enabledRing = 'enabledRing';
  static const _screenPassword = '%s_screenPassword';
  static const _enabledBiometric = '%s_enabledBiometric';
  static const _chatFontSizeFactor = '%s_chatFontSizeFactor';
  static const _chatBackground = '%s_chatBackground_%s';
  static const _isAppFirstLaunch = 'isAppFirstLaunch';
  static const _isFirstLogin = 'isFirstLogin';
  static const _isAIMode = '%s_isAIMode';
  static const _isAIModeFirstOn = '%s_isAIModeFirstOn';
  static const _aiAvatar = "%s_aiAvatar";
  static const _recordedVoicePrompt = "%s_recordedVoicePrompt";
  static const _recordedAISoulPromptPartOne = "%s_recordedAISoulPromptPartOne";
  static const _recordedAISoulPromptPartTwo = "%s_recordedAISoulPromptPartTwo";
  static const _recordedAISoulPromptPartThree =
      "%s_recordedAISoulPromptPartThree";
  static const _voiceCloningLastLeftStep = "%s_voiceCloningLastLeftStep";
  static const _voiceCloningPreviewModelTaskId =
      "%s_voiceCloningPreviewModelTaskId";
  static const _voiceCloningActualModelTaskId =
      "%s_voiceCloningActualModelTaskId";
  static const _registerLocation = 'location';
  static const _worldFilterData = "%s_worldFilterData";
  static const _ongoingSSO = 'ongoingSSO';
  static const _isDoNotDisturbMode = '%s_isDoNotDisturbMode';
  static const _lastIgnoreUpdateVersion = 'lastIgnoreUpdateVersion';

  DataSp._();

  static init() async {
    await SpUtil().init();
  }

  static String getKey(String key, {String key2 = ""}) {
    return sprintf(key, ["TOREPLACE: USERID", key2]);
  }

  static Future<String?> get imToken async =>
      (await getLoginCertificate())?.imToken;

  static Future<String?> get chatToken async =>
      (await getLoginCertificate())?.chatToken;

  static Future<String?> get userID async =>
      (await getLoginCertificate())?.userID;

  static Future<String?> get type async => (await getLoginCertificate())?.type;

  static Future<bool>? putLoginCertificate(LoginCertificate lc) {
    return SpUtil().putObject(_loginCertificate, lc);
  }

  static Future<bool>? putLoginAccount(Map map) {
    return SpUtil().putObject(_loginAccount, map);
  }

  static Future<LoginCertificate?> getLoginCertificate() {
    return SpUtil()
        .getObj(_loginCertificate, (v) => LoginCertificate.fromJson(v.cast()));
  }

  static Future<bool>? removeLoginCertificate() {
    return SpUtil().remove(_loginCertificate);
  }

  static Future<Map?> getLoginAccount() {
    return SpUtil().getObject(_loginAccount);
  }

  static Future<bool>? putServerConfig(Map<String, String> config) {
    return SpUtil().putObject(_server, config);
  }

  static Future<Map?> getServerConfig() {
    return SpUtil().getObject(_server);
  }

  static Future<bool>? putServerIP(String ip) {
    return SpUtil().putString(ip, ip);
  }

  static Future<String?> getServerIP() {
    return SpUtil().getString(_ip);
  }

  static Future<String> getDeviceID() async {
    String id = await SpUtil().getString(_deviceID) ?? '';
    if (id.isEmpty) {
      id = const Uuid().v4();
      SpUtil().putString(_deviceID, id);
    }
    return id;
  }

  static Future<bool>? putExcludedCountryCodeForPhoneRegistration(
      List<String> countryCodes) {
    return SpUtil()
        .putStringList(_excludedCountryCodeForPhoneRegistration, countryCodes);
  }

  static Future<List<String>?> getExcludedCountryCodeForPhoneRegistration() {
    return SpUtil()
        .getStringList(_excludedCountryCodeForPhoneRegistration, defValue: []);
  }

  static Future<bool>? putRegisterLocation(String location) {
    return SpUtil().putString(_registerLocation, location);
  }

  static Future<String?> getRegisterLocation() {
    return SpUtil().getString(_registerLocation, defValue: null);
  }
}
