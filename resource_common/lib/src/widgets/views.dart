import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resource_common/resource_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';

class IMViews {
  IMViews._();

  static final ImagePicker _picker = ImagePicker();

  static Future showToast(String msg, {Duration? duration}) {
    if (msg.trim().isNotEmpty) {
      return EasyLoading.showToast(msg, duration: duration);
    } else {
      return Future.value();
    }
  }

  static void showDialog({String? forCode}) {
    if (forCode == null || forCode.trim().isEmpty) return;
    showDialogWithCodeTable(forCode);
  }

  static void showDialogWithCodeTable(String code) {
    switch (code) {
      case "80306":
        Get.dialog(CustomConfirmDialog(
          title: StrRes.currentNetworkNotAvailable,
          confirmText: StrRes.retry,
        ));
        break;
      case "90101":
        Get.dialog(CustomConfirmDialog(
          title: StrRes.currentNetworkNotAvailable,
          confirmText: StrRes.acknowledged,
        ));
        break;
      case "90102":
        Get.dialog(CustomConfirmDialog(
          title: StrRes.currentNetworkNotAvailable,
          confirmText: StrRes.acknowledged,
        ));
        break;
      case "90103":
        Get.dialog(CustomConfirmDialog(
          title: StrRes.currentNetworkNotAvailable,
          confirmText: StrRes.acknowledged,
        ));
        break;
      default:
        Get.dialog(CustomConfirmDialog(
          title: StrRes.currentNetworkNotAvailable,
          confirmText: StrRes.retry,
        ));
        break;
    }
  }

  static Widget buildHeader() => WaterDropMaterialHeader(
        backgroundColor: Styles.c_000000,
      );

  static Widget buildFooter() => CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            // body = Text("pull up load");
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            // body = Text("Load Failed!Click retry!");
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.canLoading) {
            // body = Text("release to load more");
            body = const CupertinoActivityIndicator();
          } else {
            // body = Text("No more Data");
            body = const SizedBox();
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      );

  static void openPhotoSheet(
      {Function(dynamic path, dynamic url, dynamic bytes)? onData,
      bool crop = true,
      bool toUrl = true,
      bool fromGallery = true,
      bool fromCamera = true,
      TextStyle? itemTextStyle,
      TextStyle? cancelTextStyle,
      List<SheetItem> items = const [],
      int quality = 80,
      BuildContext? context}) {
    Get.bottomSheet(
      BottomSheetView(
        cancelTextStyle: cancelTextStyle,
        items: [
          ...items,
          if (fromCamera)
            SheetItem(
              textStyle: itemTextStyle,
              label: StrRes.toolboxCamera,
              onTap: () {
                if (kIsWeb) {
                  (() async {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (null != image?.path) {
                      var map = await _uCropPic(image!.path,
                          crop: crop,
                          toUrl: toUrl,
                          quality: quality,
                          context: context);
                      onData?.call(map['path'], map['url'], map['bytes']);
                    }
                  })();
                } else {
                  Permissions.camera(() async {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (null != image?.path) {
                      var map = await _uCropPic(image!.path,
                          crop: crop,
                          toUrl: toUrl,
                          quality: quality,
                          context: context);
                      onData?.call(map['path'], map['url'], map['bytes']);
                    }
                  });
                }
              },
            ),
          if (fromGallery)
            SheetItem(
              textStyle: itemTextStyle,
              label: StrRes.toolboxAlbum,
              onTap: () {
                if (kIsWeb) {
                  (() async {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (null != image?.path) {
                      var map = await _uCropPic(image!.path,
                          crop: crop,
                          toUrl: toUrl,
                          quality: quality,
                          context: context);
                      onData?.call(map['path'], map['url'], map['bytes']);
                    }
                  })();
                } else {
                  Permissions.storage(() async {
                    final XFile? image = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (null != image?.path) {
                      var map = await _uCropPic(image!.path,
                          crop: crop, toUrl: toUrl, quality: quality);
                      onData?.call(map['path'], map['url'], map['bytes']);
                    }
                  });
                }
              },
            ),
        ],
      ),
    );
  }

  static Future<Map<String, dynamic>> _uCropPic(
    String path, {
    bool crop = true,
    bool toUrl = true,
    int quality = 80,
    BuildContext? context,
  }) async {
    CroppedFile? cropFile;
    String? url;
    if (crop && !path.endsWith('.gif')) {
      cropFile = await IMUtils.uCrop(path, context);
      if (cropFile == null) {
        // 放弃选择
        // return {'path': cropFile?.path ?? path, 'url': url};
        return {'path': null, 'url': null, 'bytes': null};
      }
    }
    if (toUrl) {
      String putID = const Uuid().v4();
      dynamic result;
      if (null != cropFile) {
        Logger.print('-----------crop path: ${cropFile.path}');
        result = await LoadingView.singleton.wrap(asyncFunction: () async {
          final image = await IMUtils.compressImageAndGetFile(
              File(cropFile!.path),
              quality: quality);

          /// TOREPLACE
          /*
          return.uploadFile(
            id: putID,
            filePath: image!.path,
            fileName: image.path.split('/').last,
          );
          */
        });
      } else {
        Logger.print('-----------source path: $path');
        result = await LoadingView.singleton.wrap(asyncFunction: () async {
          final image = await IMUtils.compressImageAndGetFile(File(path),
              quality: quality);

          /// TOREPLACE
          /*
          return uploadFile(
            id: putID,
            filePath: image!.path,
            fileName: image.path,
          );
          */
        });
      }
      if (result is String) {
        url = jsonDecode(result)['url'];
        Logger.print('url:$url');
      }
    }

    return {
      'path': cropFile?.path ?? path,
      'url': url,
      'bytes': await cropFile?.readAsBytes()
    };
  }

  static void openDownloadSheet(
    String url, {
    Function()? onDownload,
  }) {
    Get.bottomSheet(
      BottomSheetView(
        items: [
          SheetItem(
            label: StrRes.download,
            onTap: () {
              Permissions.storage(() => onDownload?.call());
            },
          ),
        ],
      ),
      barrierColor: Colors.transparent,
    );
  }

  static TextSpan getTimelineTextSpan(int ms) {
    int locTimeMs = DateTime.now().millisecondsSinceEpoch;
    var languageCode = Get.locale?.languageCode ?? 'zh';

    if (DateUtil.isToday(ms, locMs: locTimeMs)) {
      return TextSpan(
        text: languageCode == 'zh' ? '今天' : 'Today',
        style: Styles.ts_0C1C33_17sp_medium,
      );
    }

    if (DateUtil.isYesterdayByMs(ms, locTimeMs)) {
      return TextSpan(
        text: languageCode == 'zh' ? '昨天' : 'Yesterday',
        style: Styles.ts_0C1C33_17sp_medium,
      );
    }

    if (DateUtil.isWeek(ms, locMs: locTimeMs)) {
      final weekday = DateUtil.getWeekdayByMs(ms, languageCode: languageCode);
      if (weekday.contains('星期')) {
        return TextSpan(
          text: weekday.replaceAll('星期', ''),
          style: Styles.ts_0C1C33_17sp_medium,
          children: [
            TextSpan(
              text: '\n星期',
              style: Styles.ts_0C1C33_12sp_medium,
            ),
          ],
        );
      }
      return TextSpan(text: weekday, style: Styles.ts_0C1C33_17sp_medium);
    }

    // if (DateUtil.yearIsEqualByMs(ms, locTimeMs)) {
    //   final date = IMUtils.formatDateMs(ms, format: 'MM月dd');
    //   final one = date.split('月')[0];
    //   final two = date.split('月')[1];
    //   return TextSpan(
    //     text: two,
    //     style: Styles.ts_0C1C33_17sp_medium,
    //     children: [
    //       TextSpan(
    //         text: '\n$one${languageCode == 'zh' ? '月' : ''}',
    //         style: Styles.ts_0C1C33_12sp_medium,
    //       ),
    //     ],
    //   );
    // }
    final date = IMUtils.formatDateMs(ms, format: 'MM月dd');
    final one = date.split('月')[0];
    final two = date.split('月')[1];
    return TextSpan(
      text: '${int.parse(two)}',
      style: Styles.ts_0C1C33_17sp_medium,
      children: [
        TextSpan(
          text: '\n${int.parse(one)}${languageCode == 'zh' ? '月' : ''}',
          style: Styles.ts_0C1C33_12sp_medium,
        ),
      ],
    );
  }

  static void showSinglePicker({
    required String title,
    required String description,
    required dynamic pickerData,
    bool isArray = false,
    List<int>? selected,
    Function(List<int> indexList, List valueList)? onConfirm,
  }) {
    Picker(
      adapter: PickerDataAdapter<String>(
        pickerData: pickerData,
        isArray: isArray,
      ),
      changeToFirst: true,
      hideHeader: false,
      containerColor: Styles.c_000000,
      textStyle: Styles.ts_0C1C33_17sp,
      selectedTextStyle: Styles.ts_0C1C33_17sp,
      itemExtent: 45,
      cancelTextStyle: Styles.ts_0C1C33_17sp,
      confirmTextStyle: Styles.ts_000000_17sp,
      cancelText: StrRes.cancel,
      confirmText: StrRes.confirm,
      selecteds: selected,
      builderHeader: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 7),
            child: title.toText..style = Styles.ts_0C1C33_17sp,
          ),
          description.toText..style = Styles.ts_8E9AB0_14sp,
        ],
      ),
      selectionOverlay: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(color: Styles.c_E8EAEF, width: 1),
            top: BorderSide(color: Styles.c_E8EAEF, width: 1),
          ),
        ),
      ),
      onConfirm: (Picker picker, List value) {
        onConfirm?.call(picker.selecteds, picker.getSelectedValues());
        // 在此处执行选定项目的逻辑
      },
    ).showDialog(Get.context!);
  }
}
