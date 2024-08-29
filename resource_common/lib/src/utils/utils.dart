import 'dart:async';
import 'dart:convert';
// import 'dart:html' as html;
import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resource_common/resource_common.dart';

import '../widgets/very_picture_preview.dart';

/// 间隔时间完成某事
class IntervalDo {
  DateTime? last;
  Timer? lastTimer;

  //call---milliseconds---call
  void run({required Function() fuc, int milliseconds = 0}) {
    DateTime now = DateTime.now();
    if (null == last ||
        now.difference(last ?? now).inMilliseconds > milliseconds) {
      last = now;
      fuc();
    }
  }

  //---milliseconds----milliseconds....---call  在milliseconds时连续的调用会被丢弃并重置milliseconds的时间，milliseconds后才会call
  void drop({required Function() fun, int milliseconds = 0}) {
    lastTimer?.cancel();
    lastTimer = null;
    lastTimer = Timer(Duration(milliseconds: milliseconds), () {
      lastTimer!.cancel();
      lastTimer = null;
      fun.call();
    });
  }
}

class MediaSource {
  final String url;
  final String thumbnail;

  MediaSource(this.url, this.thumbnail);
}

class IMUtils {
  IMUtils._();

  static Future<CroppedFile?> uCrop(String path, [BuildContext? context]) {
    int frameSize = 0;
    int croppedSize = 0;
    if (context != null) {
      frameSize = (MediaQuery.of(context).size.width * 0.5).toInt();
      croppedSize = (frameSize * 0.6).toInt();
    }

    return ImageCropper().cropImage(
      sourcePath: path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: Styles.c_000000,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        IOSUiSettings(
          title: '',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        if (kIsWeb && context != null)
          WebUiSettings(
            context: context,
            presentStyle: WebPresentStyle.dialog,
            size: CropperSize(width: frameSize, height: frameSize),
            minContainerHeight: croppedSize,
            minContainerWidth: croppedSize,
            zoomable: true,
          ),
      ],
    );
  }

  ///  compress file and get file.
  static Future<File?> compressImageAndGetFile(File file,
      {int quality = 80}) async {
    var path = file.path;
    var name = path.substring(path.lastIndexOf("/") + 1);
    var targetPath = await createTempFile(name: name, dir: 'pic');
    if (name.endsWith('.gif')) {
      return file;
    }

    CompressFormat format = CompressFormat.jpeg;
    if (name.endsWith(".jpg") || name.endsWith(".jpeg")) {
      format = CompressFormat.jpeg;
    } else if (name.endsWith(".png")) {
      format = CompressFormat.png;
    } else if (name.endsWith(".heic")) {
      format = CompressFormat.heic;
    } else if (name.endsWith(".webp")) {
      format = CompressFormat.webp;
    }

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
      minWidth: 480,
      minHeight: 800,
      // minHeight: 1920,
      // minWidth: 1080,
      format: format,
    );
    return result != null ? File(result.path) : null;
  }

  static String getSuffix(String url) {
    if (!url.contains(".")) return "";
    return url.substring(url.lastIndexOf('.'), url.length);
  }

  static bool isGif(String url) {
    return IMUtils.getSuffix(url).contains("gif");
  }

  static void copy({required String text}) {
    Clipboard.setData(ClipboardData(text: text));
    IMViews.showToast(StrRes.copySuccessfully);
  }

  static Future<String?> paste() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text;
  }

  static String? emptyStrToNull(String? str) =>
      (null != str && str.trim().isEmpty) ? null : str;

  static String? emptyStrPrefixSufixToNull(String? str,
          {String prefix = '', String suffix = ''}) =>
      (null != str && str.trim().isEmpty)
          ? null
          : emptyStrToNull('$prefix$str$suffix');

  static String? intZeroToNull(int? str,
          {String prefix = '', String suffix = ''}) =>
      (null != str && str == 0)
          ? null
          : emptyStrToNull('$prefix${str.toString()}$suffix');

  static bool isNotNullEmptyStr(String? str) => null != str && "" != str.trim();

  static bool isChinaMobile(String mobile) {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return exp.hasMatch(mobile);
  }

  static bool isMobile(String areaCode, String mobile) =>
      (areaCode == '+86' || areaCode == '86') ? isChinaMobile(mobile) : true;

  static bool isEmail(String email) {
    RegExp regex = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');
    return regex.hasMatch(email);
  }

  static bool isValidUsername(String username) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]{6,20}$');
    return regex.hasMatch(username);
  }

  static bool isSimplePassword(String password) {
    RegExp regex = RegExp(
        r'(?:012|123|234|345|456|567|678|789)|(?:abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz)');
    return regex.hasMatch(password);
  }

  static String getFileNameFromUrl(String url) {
    Uri uri = Uri.parse(url);
    List<String> pathSegments = uri.pathSegments;

    if (pathSegments.isNotEmpty) {
      return pathSegments.last;
    } else {
      return "unknown_filename";
    }
  }

  static Future<String?> getCacheFile({
    required String dir,
    required String name,
  }) async {
    final storage = (Platform.isIOS
        ? await getApplicationCacheDirectory()
        : await getExternalStorageDirectory());
    final dirPath = Directory('${storage!.path}/$dir').path;
    File file = File('$dirPath/$name');
    return file.path;
  }

  static Future<String> createTempFile({
    required String dir,
    required String name,
  }) async {
    final storage = await createTempDir(dir: dir);
    File file = File('$storage/$name');
    if (!(await file.exists())) {
      file.create();
    }
    return file.path;
  }

  static Future<void> deleteFile(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        Logger.print('creturn File deleted successfully');
      } else {
        Logger.print('creturn File does not exist');
      }
    } catch (e) {
      Logger.print('creturn Error deleting file: $e');
    }
  }

  static Future<String> createTempDir({
    required String dir,
  }) async {
    final storage = (Platform.isIOS
        ? await getApplicationCacheDirectory()
        : await getExternalStorageDirectory());
    Directory directory = Directory('${storage!.path}/$dir');
    if (!(await directory.exists())) {
      directory.create(recursive: true);
    }
    return directory.path;
  }

  static int compareVersion(String val1, String val2) {
    var arr1 = val1.split(".");
    var arr2 = val2.split(".");
    int length = arr1.length >= arr2.length ? arr1.length : arr2.length;
    int diff = 0;
    int v1;
    int v2;
    for (int i = 0; i < length; i++) {
      v1 = i < arr1.length ? int.parse(arr1[i]) : 0;
      v2 = i < arr2.length ? int.parse(arr2[i]) : 0;
      diff = v1 - v2;
      if (diff == 0) {
        continue;
      } else {
        return diff > 0 ? 1 : -1;
      }
    }
    return diff;
  }

  static int getPlatform() {
    final context = Get.context!;
    if (kIsWeb) {
      return 5; // web
    }
    if (Platform.isAndroid) {
      return context.isTablet ? 8 : 2; // android
    } else {
      return context.isTablet ? 9 : 1; // ios and others
    }
  }

  static String getChatTimeline(int ms, [String formatToday = 'h:mm a']) {
    final locTimeMs = DateTime.now().millisecondsSinceEpoch;
    String languageCountryCode =
        IMUtils.geAppElseDeviceLocale().toLanguageCountryCode();
    final languageKey =
        TranslationService.reverseLanguageKeys[languageCountryCode]!;

    String dateFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateFormat = 'yyyy/MM/dd';
        break;
      case 'en':
        dateFormat = 'MM/dd/yyyy';
        break;
      default:
        dateFormat = 'dd/MM/yyyy';
        break;
    }

    String dateWithoutYearFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateWithoutYearFormat = 'MM/dd';
        break;
      case 'en':
        dateWithoutYearFormat = 'MM/dd';
        break;
      default:
        dateWithoutYearFormat = 'dd/MM';
        break;
    }

    var timeFormat = 'h:mm a';

    if (DateUtil.isToday(ms, locMs: locTimeMs)) {
      return formatDateMs(ms, format: formatToday);
    }

    if (DateUtil.isYesterdayByMs(ms, locTimeMs)) {
      return '${StrRes.yesterday} ${formatDateMs(ms, format: formatToday)}';
    }

    if (DateUtil.isWeek(ms, locMs: locTimeMs)) {
      return '${getWeekdayByMs(ms)} ${formatDateMs(ms, format: formatToday)}';
    }

    if (DateUtil.yearIsEqualByMs(ms, locTimeMs)) {
      return formatDateMs(ms, format: '$dateWithoutYearFormat $timeFormat');
    }

    return formatDateMs(ms, format: dateFormat);
  }

  static String getWeekday(DateTime? dateTime) {
    if (dateTime == null) return "";
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = StrRes.monday;
        break;
      case 2:
        weekday = StrRes.tuesday;
        break;
      case 3:
        weekday = StrRes.wednesday;
        break;
      case 4:
        weekday = StrRes.thursday;
        break;
      case 5:
        weekday = StrRes.friday;
        break;
      case 6:
        weekday = StrRes.saturday;
        break;
      case 7:
        weekday = StrRes.sunday;
        break;
    }
    return weekday;
  }

  static String getWeekdayByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getWeekday(dateTime);
  }

  static DateTime getDateTimeByMs(int ms, {bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: isUtc);
  }

  static String formatDateMs(int ms, {bool isUtc = false, String? format}) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: isUtc);
    String formattedDateTime = intl.DateFormat(format).format(dateTime);
    return formattedDateTime;
  }

  static bool isWithinOneMinute(int timestamp1, int timestamp2) {
    // Calculate the absolute difference between the timestamps
    int difference = (timestamp1 - timestamp2).abs();

    // Check if the difference is less than or equal to 1 minute (60,000 milliseconds)
    return difference <= 60000;
  }

  static String seconds2HMS(int seconds) {
    int h = 0;
    int m = 0;
    int s = 0;
    int temp = seconds % 3600;
    if (seconds > 3600) {
      h = seconds ~/ 3600;
      if (temp != 0) {
        if (temp > 60) {
          m = temp ~/ 60;
          if (temp % 60 != 0) {
            s = temp % 60;
          }
        } else {
          s = temp;
        }
      }
    } else {
      m = seconds ~/ 60;
      if (seconds % 60 != 0) {
        s = seconds % 60;
      }
    }
    if (h == 0) {
      return '${m < 10 ? '0$m' : m}:${s < 10 ? '0$s' : s}';
    }
    return "${h < 10 ? '0$h' : h}:${m < 10 ? '0$m' : m}:${s < 10 ? '0$s' : s}";
  }

  static String mutedTime(int mss) {
    int days = mss ~/ (60 * 60 * 24);
    int hours = (mss % (60 * 60 * 24)) ~/ (60 * 60);
    int minutes = (mss % (60 * 60)) ~/ 60;
    int seconds = mss % 60;
    return "${_combTime(days, StrRes.day)}${_combTime(hours, StrRes.hours)}${_combTime(minutes, StrRes.minute)}${_combTime(seconds, StrRes.seconds)}";
  }

  static String _combTime(int value, String unit) =>
      value > 0 ? '$value$unit' : '';

  /// 搜索聊天内容显示规则
  static String calContent({
    required String content,
    required String key,
    required TextStyle style,
    required double usedWidth,
  }) {
    var size = calculateTextSize(content, style);
    var lave = 1.sw - usedWidth;
    if (size.width < lave) {
      return content;
    }
    var index = content.indexOf(key);
    if (index == -1 || index > content.length - 1) return content;
    var start = content.substring(0, index);
    var end = content.substring(index);
    var startSize = calculateTextSize(start, style);
    var keySize = calculateTextSize(key, style);
    if (startSize.width + keySize.width > lave) {
      if (index - 4 > 0) {
        return "...${content.substring(index - 4)}";
      } else {
        return "...$end";
      }
    } else {
      return content;
    }
  }

  // Here it is!
  static Size calculateTextSize(
    String text,
    TextStyle style, {
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static TextPainter getTextPainter(
    String text,
    TextStyle style, {
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) =>
      TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: maxLines,
          textDirection: TextDirection.ltr)
        ..layout(minWidth: 0, maxWidth: maxWidth);

  static bool isUrlValid(String? url) {
    if (null == url || url.isEmpty) {
      return false;
    }
    return url.startsWith("http://") || url.startsWith("https://");
  }

  static bool isValidUrl(String? urlString) {
    if (null == urlString || urlString.isEmpty) {
      return false;
    }
    Uri? uri = Uri.tryParse(urlString);
    if (uri != null && uri.hasScheme && uri.hasAuthority) {
      return true;
    }
    return false;
  }

  static openFileByOtherApp(String path) async {
    OpenResult result = await OpenFilex.open(path);
    if (result.type == ResultType.noAppToOpen) {
      IMViews.showToast("没有可支持的应用");
    } else if (result.type == ResultType.permissionDenied) {
      IMViews.showToast("无权限访问");
    } else if (result.type == ResultType.fileNotFound) {
      IMViews.showToast("文件已失效");
    }
  }

  static Future<bool> isExitFile(String? path) async {
    return isNotNullEmptyStr(path) ? await File(path!).exists() : false;
  }

  //fileExt 文件后缀名
  static String? getMediaType(final String filePath) {
    var fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
    var fileExt = fileName.substring(fileName.lastIndexOf("."));
    switch (fileExt.toLowerCase()) {
      case ".jpg":
      case ".jpeg":
      case ".jpe":
        return "image/jpeg";
      case ".png":
        return "image/png";
      case ".bmp":
        return "image/bmp";
      case ".gif":
        return "image/gif";
      case ".json":
        return "application/json";
      case ".svg":
      case ".svgz":
        return "image/svg+xml";
      case ".mp3":
        return "audio/mpeg";
      case ".mp4":
        return "video/mp4";
      case ".mov":
        return "video/mov";
      case ".htm":
      case ".html":
        return "text/html";
      case ".css":
        return "text/css";
      case ".csv":
        return "text/csv";
      case ".txt":
      case ".text":
      case ".conf":
      case ".def":
      case ".log":
      case ".in":
        return "text/plain";
    }
    return null;
  }

  /// 将字节数转化为MB
  static String formatBytes(int bytes) {
    int kb = 1024;
    int mb = kb * 1024;
    int gb = mb * 1024;
    if (bytes >= gb) {
      return sprintf("%.1f GB", [bytes / gb]);
    } else if (bytes >= mb) {
      double f = bytes / mb;
      return sprintf(f > 100 ? "%.0f MB" : "%.1f MB", [f]);
    } else if (bytes > kb) {
      double f = bytes / kb;
      return sprintf(f > 100 ? "%.0f KB" : "%.1f KB", [f]);
    } else {
      return sprintf("%d B", [bytes]);
    }
  }

  // static IconData fileIcon(String fileName) {
  //   var mimeType = lookupMimeType(fileName) ?? '';
  //   if (mimeType == 'application/pdf') {
  //     return FontAwesomeIcons.solidFilePdf;
  //   } else if (mimeType == 'application/msword' ||
  //       mimeType ==
  //           'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
  //     return FontAwesomeIcons.solidFileWord;
  //   } else if (mimeType == 'application/vnd.ms-excel' ||
  //       mimeType ==
  //           'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
  //     return FontAwesomeIcons.solidFileExcel;
  //   } else if (mimeType == 'application/vnd.ms-powerpoint') {
  //     return FontAwesomeIcons.solidFilePowerpoint;
  //   } else if (mimeType.startsWith('audio/')) {
  //   } else if (mimeType == 'application/zip' ||
  //       mimeType == 'application/x-rar-compressed') {
  //     return FontAwesomeIcons.solidFileZipper;
  //   } else if (mimeType.startsWith('audio/')) {
  //     return FontAwesomeIcons.solidFileAudio;
  //   } else if (mimeType.startsWith('video/')) {
  //     return FontAwesomeIcons.solidFileVideo;
  //   } else if (mimeType.startsWith('image/')) {
  //     return FontAwesomeIcons.solidFileImage;
  //   } else if (mimeType == 'text/plain') {
  //     return FontAwesomeIcons.solidFileCode;
  //   }
  //   return FontAwesomeIcons.solidFileLines;
  // }

  static String fileIcon(String fileName) {
    var mimeType = lookupMimeType(fileName) ?? '';
    if (mimeType == 'application/pdf') {
      return ImageRes.filePdf;
    } else if (mimeType == 'application/msword' ||
        mimeType ==
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
      return ImageRes.fileWord;
    } else if (mimeType == 'application/vnd.ms-excel' ||
        mimeType ==
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
      return ImageRes.fileExcel;
    } else if (mimeType == 'application/vnd.ms-powerpoint') {
      return ImageRes.filePpt;
    } else if (mimeType.startsWith('audio/')) {
    } else if (mimeType == 'application/zip' ||
        mimeType == 'application/x-rar-compressed') {
      return ImageRes.fileZip;
    }
    /*else if (mimeType.startsWith('audio/')) {
      return FontAwesomeIcons.solidFileAudio;
    } else if (mimeType.startsWith('video/')) {
      return FontAwesomeIcons.solidFileVideo;
    } else if (mimeType.startsWith('image/')) {
      return FontAwesomeIcons.solidFileImage;
    } else if (mimeType == 'text/plain') {
      return FontAwesomeIcons.solidFileCode;
    }*/
    return ImageRes.fileUnknown;
  }

  static String getWorkMomentsTimeline(int ms,
      [String formatToday = 'h:mm a']) {
    final locTimeMs = DateTime.now().millisecondsSinceEpoch;
    String languageCountryCode =
        IMUtils.geAppElseDeviceLocale().toLanguageCountryCode();
    final languageKey =
        TranslationService.reverseLanguageKeys[languageCountryCode]!;

    String dateFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateFormat = 'yyyy/MM/dd';
        break;
      case 'en':
        dateFormat = 'MM/dd/yyyy';
        break;
      default:
        dateFormat = 'dd/MM/yyyy';
        break;
    }

    String dateWithoutYearFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateWithoutYearFormat = 'MM/dd';
        break;
      case 'en':
        dateWithoutYearFormat = 'MM/dd';
        break;
      default:
        dateWithoutYearFormat = 'dd/MM';
        break;
    }

    var timeFormat = 'h:mm a';

    if (DateUtil.isToday(ms, locMs: locTimeMs)) {
      return formatDateMs(ms, format: formatToday);
    }

    if (DateUtil.isYesterdayByMs(ms, locTimeMs)) {
      return '${StrRes.yesterday} ${formatDateMs(ms, format: formatToday)}';
    }

    if (DateUtil.isWeek(ms, locMs: locTimeMs)) {
      return '${getWeekdayByMs(ms)} ${formatDateMs(ms, format: formatToday)}';
    }

    if (DateUtil.yearIsEqualByMs(ms, locTimeMs)) {
      return formatDateMs(ms, format: '$dateWithoutYearFormat $timeFormat');
    }

    return formatDateMs(ms, format: dateFormat);
  }

  static String getTimeFormat1() {
    String languageCountryCode =
        IMUtils.geAppElseDeviceLocale().toLanguageCountryCode();
    final languageKey =
        TranslationService.reverseLanguageKeys[languageCountryCode]!;
    String dateFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateFormat = 'yyyy/MM/dd';
        break;
      case 'en':
        dateFormat = 'MM/dd/yyyy';
        break;
      default:
        dateFormat = 'dd/MM/yyyy';
        break;
    }
    return dateFormat;
  }

  static String getTimeFormat2() {
    return '${getTimeFormat1()} h:mm a';
  }

  static String getTimeFormat3() {
    String languageCountryCode =
        IMUtils.geAppElseDeviceLocale().toLanguageCountryCode();
    final languageKey =
        TranslationService.reverseLanguageKeys[languageCountryCode]!;
    String dateTimeWithoutYearFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateTimeWithoutYearFormat = 'MM/dd';
        break;
      case 'en':
        dateTimeWithoutYearFormat = 'MM/dd';
        break;
      default:
        dateTimeWithoutYearFormat = 'dd/MM';
        break;
    }
    return '$dateTimeWithoutYearFormat h:mm a';
  }

  static String getTimeFormat4() {
    String languageCountryCode =
        IMUtils.geAppElseDeviceLocale().toLanguageCountryCode();
    final languageKey =
        TranslationService.reverseLanguageKeys[languageCountryCode]!;
    String dateWithoutYearFormat;
    switch (languageKey) {
      case 'zh':
      case 'tw':
      case 'jp':
      case 'kr':
        dateWithoutYearFormat = 'MM/dd';
        break;
      case 'en':
        dateWithoutYearFormat = 'MM/dd';
        break;
      default:
        dateWithoutYearFormat = 'dd/MM';
        break;
    }
    return dateWithoutYearFormat;
  }

  static String getTimeFormat5() {
    return 'h:mm a';
  }

  static bool isValidPassword(String password) => RegExp(
        // r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!.])(?=.{6,20}$)',
        // r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,20}$',
        // r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,20}$',
        r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\S]{6,20}$',
      ).hasMatch(password);

  static TextInputFormatter getPasswordFormatter() =>
      FilteringTextInputFormatter.allow(
        // RegExp(r'[a-zA-Z0-9]'),
        RegExp(r'[a-zA-Z0-9\S]'),
      );

  // static TextInputFormatter getCurrencyFormatter() =>
  //     FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,8}'));

  static TextInputFormatter getCurrencyFormatter({int maxDecimalPlaces = 8}) {
    String pattern = '^\\d*\\.?\\d{0,$maxDecimalPlaces}';
    return FilteringTextInputFormatter.allow(RegExp(pattern));
  }

  static String getLanguageCode() {
    String languageCode = Get.locale?.countryCode ?? 'en';
    return languageCode;
  }

  static String getDeviceLanguageCode() {
    String languageCode = Get.deviceLocale?.countryCode ?? 'en';
    return languageCode;
  }

  static String geAppElseDeviceLanguageCode() {
    String languageCode =
        Get.locale?.languageCode ?? Get.deviceLocale?.languageCode ?? 'en';
    return languageCode;
  }

  static String geAppElseDeviceCountryCode() {
    String languageCode =
        Get.locale?.countryCode ?? Get.deviceLocale?.countryCode ?? 'en';
    return languageCode;
  }

  static Locale geAppElseDeviceLocale() {
    Logger.print("creturn ${Get.locale}");
    return Get.locale ?? Get.deviceLocale ?? const Locale('en', 'US');
  }

  static String censor({required String input, numOfAsterisk = 3}) {
    return input;

    /*
    if (input.length < numOfAsterisk) {
      return input;
    }

    String firstTwoChar = input.substring(0, 2);
    String lastChar = input.substring(input.length - 1);

    return firstTwoChar + ('*' * numOfAsterisk) + lastChar;
    */
  }

// md5 加密
  static String? generateMD5(String? data) {
    if (null == data) return null;
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }

  static Future<String> getCacheFileDir() async {
    return (await getTemporaryDirectory()).absolute.path;
  }

  static void previewUrlPicture(
    List<MediaSource> sources, {
    int currentIndex = 0,
    String? heroTag,
  }) =>
      navigator?.push(TransparentRoute(
        builder: (BuildContext context) => GestureDetector(
          onTap: () => Get.back(),
          child: VeryPicturePreview(
            currentIndex: currentIndex,
            images: sources,
            heroTag: heroTag,
            onLongPress: (url) {},
          ),
        ),
      ));

  static void launchEmail({
    required String receiver,
    String subject = '',
    String body = '',
  }) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: receiver,
        query: encodeQueryParameters(<String, String>{
          'subject': subject,
          'body': body,
        }), //add subject and body here
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri,
            mode: LaunchMode.externalApplication); //open with in-app browser
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    } catch (error) {
      debugPrint('Error lauching email app: $error');
    }
  }

  static Future<void> runDelayed(
      {required int seconds, required void Function() fn}) async {
    await Future.delayed(Duration(seconds: seconds), () => fn());
  }

  static Future saveImage(Uint8List image, String fileName) async {
    /*
    final blob = html.Blob([image], 'image/png');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
    if (true) {
      var tips = StrRes.saveSuccessfully;
      IMViews.showToast(tips);
    }
    */
  }

  static void launchWebpage(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri,
            mode: LaunchMode.platformDefault); //open with in-app browser
      } else {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      print(e);
    }
  }
}

extension LocaleExtension on Locale {
  String toLanguageCountryCode() {
    switch (languageCode) {
      case 'zh':
        switch (scriptCode) {
          case 'Hans':
            return 'zh_CN';
          case 'Hant':
            return 'zh_TW';
          default:
            return '${languageCode}_$countryCode';
        }
      case 'es':
        return 'es_ES';
      case 'pt':
        return 'pt_PT';
      case 'vi':
        return 'vi_VN';
      case 'ja':
        return 'ja_JP';
      case 'ko':
        return 'ko_KR';
      case 'fr':
        return 'fr_FR';
      case 'de':
        return 'de_DE';
      case 'hi':
        return 'hi_IN';
      case 'it':
        return 'it_IT';
      case 'pl':
        return 'pl_PL';
      case 'ru':
        return 'ru_RU';
      case 'tr':
        return 'tr_TR';
      case 'en':
      default:
        return 'en_US';
    }
  }
}

extension ExtForCryptoCurrencyString on String {
  currencyFormat(
      {bool withoutSymbol = false,
      int padding = 2,
      bool withDecimal = true,
      bool tightDecimal = false}) {
    final parts = split('.');
    final wholeNumber = parts[0];
    final decimal = (parts.length > 1 ? parts[1] : '').padRight(padding, '0');
    final decimalPoint = double.parse(decimal) > 0.0 ? '.$decimal' : '';
    return '${withoutSymbol ? '' : '\$ '}${intl.NumberFormat('#,###').format(num.tryParse(wholeNumber) ?? 0)}${withDecimal ? decimalPoint : ''}';
    // return '${NumberFormat.decimalPattern().format(num.tryParse(parts[0]) ?? 0.0)}.${parts[1]}';
  }
}

extension ExtForWeb3Wallet on String {
  truncatedHex() {
    var hexCode = this;
    if (hexCode.length <= 12) {
      return hexCode;
    }

    final prefix = hexCode.substring(0, 6);
    final suffix = hexCode.substring(hexCode.length - 6);
    return '$prefix...$suffix';
  }
}
