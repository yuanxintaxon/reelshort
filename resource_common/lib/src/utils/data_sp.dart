import 'package:resource_common/resource_common.dart';
import 'package:sprintf/sprintf.dart';
import 'package:uuid/uuid.dart';

class DataSp {
  static const _loginCertificate = 'loginCertificate';
  static const _loginAccount = 'loginAccount';
  static const _deviceID = 'deviceID';

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

  static Future<String> getDeviceID() async {
    String id = await SpUtil().getString(_deviceID) ?? '';
    if (id.isEmpty) {
      id = const Uuid().v4();
      SpUtil().putString(_deviceID, id);
    }
    return id;
  }
}
