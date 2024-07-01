import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_common/resource_common.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timeago/timeago.dart' as Timeago;

import 'models/config/AppEnv.dart';

class Config {
  //初始化全局信息
  static Future init(Function() runApp) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the AppEnv with the desired environment
    AppEnv.instance.init(Environment.DEV);

    // disabled http fetching for google fonts
    GoogleFonts.config.allowRuntimeFetching = false;

    // licensing for google fonts
    _setupGoogleFontLicenses();

    // init cache
    try {
      final path = (await getApplicationDocumentsDirectory()).path;
      cachePath = '$path/';
      await DataSp.init();
      await Hive.initFlutter(path);
      // await SpeechToTextUtil.instance.initSpeech();
      HttpUtil.init();
      _setupLocaleForTimeAgo();
    } catch (_) {}

    // ================== run app here ==================
    runApp();
    // ==================================================

    // 设置屏幕方向
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // 状态栏透明（Android）
    // var brightness = Platform.isAndroid ? Brightness.dark : Brightness.light;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarBrightness: brightness,
    //   statusBarIconBrightness: brightness,
    // ));

    // cremove on web
    // FlutterBugly.init(androidAppId: "", iOSAppId: "");
  }

  static void _setupGoogleFontLicenses() {
    LicenseRegistry.addLicense(() async* {
      final abrilFatfaceLicense = await rootBundle
          .loadString('assets/google_fonts/abril_fatface/OFL.txt');
      final archivoNarrowLicense = await rootBundle
          .loadString('assets/google_fonts/archivo_narrow/OFL.txt');
      final interLicense =
          await rootBundle.loadString('assets/google_fonts/inter/OFL.txt');
      final mohaveLicense =
          await rootBundle.loadString('assets/google_fonts/mohave/OFL.txt');
      final montserratLicense =
          await rootBundle.loadString('assets/google_fonts/montserrat/OFL.txt');
      final notoSansLicense =
          await rootBundle.loadString('assets/google_fonts/noto_sans/OFL.txt');
      final abeezeeLicense =
          await rootBundle.loadString('assets/google_fonts/abeezee/OFL.txt');

      yield LicenseEntryWithLineBreaks(['abril_fatface'], abrilFatfaceLicense);
      yield LicenseEntryWithLineBreaks(
          ['archivo_narrow'], archivoNarrowLicense);
      yield LicenseEntryWithLineBreaks(['inter'], interLicense);
      yield LicenseEntryWithLineBreaks(['mohave'], mohaveLicense);
      yield LicenseEntryWithLineBreaks(['montserrat'], montserratLicense);
      yield LicenseEntryWithLineBreaks(['noto_sans'], notoSansLicense);
      yield LicenseEntryWithLineBreaks(['abeezee'], abeezeeLicense);
    });
  }

  static void _setupLocaleForTimeAgo() {
    Timeago.setLocaleMessages('de', TimeagoCustomMessages());
    Timeago.setLocaleMessages('en', TimeagoCustomMessages());
    Timeago.setLocaleMessages('es', TimeagoCustomMessages());
    Timeago.setLocaleMessages('fr', TimeagoCustomMessages());
    Timeago.setLocaleMessages('hi', TimeagoCustomMessages());
    Timeago.setLocaleMessages('it', TimeagoCustomMessages());
    Timeago.setLocaleMessages('ja', TimeagoCustomMessages());
    Timeago.setLocaleMessages('ko', TimeagoCustomMessages());
    Timeago.setLocaleMessages('pl', TimeagoCustomMessages());
    Timeago.setLocaleMessages('pt', TimeagoCustomMessages());
    Timeago.setLocaleMessages('ru', TimeagoCustomMessages());
    Timeago.setLocaleMessages('tr', TimeagoCustomMessages());
    Timeago.setLocaleMessages('vi', TimeagoCustomMessages());
    Timeago.setLocaleMessages('zh', TimeagoCustomMessages());
    // missing taiwan
  }

  static late String cachePath;
  static const uiW = 375.0;
  static const uiH = 812.0;

  /// 全局字体size
  static const double textScaleFactor = 1.0;

  /// 秘钥
  static const secret = 'tuoyun';

  static const mapKey = '';

  // App environment initilization
  static String get _host => AppEnv.instance.config.serverHost;
  static String get _apiVersion => AppEnv.instance.config.serverVersion;

  static const _ipRegex =
      '((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)';

  static bool get _isIP => RegExp(_ipRegex).hasMatch(_host);

  /// 服务器IP
  static String get serverIp {
    return _host;
  }

  /// App 业务务器地址
  /// $apiScheme://$host/wdc-social/api/$_apiVersion/
  /// $apiScheme://$host:50008
  /// 端口：50008
  static String get appBusinessUrl {
    return (_isIP
        ? "http://$_host:10008"
        : "https://$_host/wdc-social/api/$_apiVersion");
  }

  /// App websocket 业务务器地址
  /// $apiScheme://$host/wdc-social/api/$_apiVersion/
  /// $apiScheme://$host:50008
  /// 端口：50008
  static String get appBusinessWsUrl {
    return "wss://$_host/wdc-social/ws/$_apiVersion";
  }

  /// 图片存储
  static String get objectStorage {
    return 'minio';
  }
}
