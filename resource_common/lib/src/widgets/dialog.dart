import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

enum DialogType {
  confirm,
}

class DialogManager {
  static OverlayEntry? overlayEntry;

  static void showHighestPriorityDialog(Widget dialog) {
    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: dialog,
          ),
        ],
      ),
    );

    Overlay.of(Get.context!).insert(overlayEntry!);
  }

  static void removeHighestPriorityDialog() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title,
    this.url,
    this.content,
    this.rightText,
    this.leftText,
    this.onTapLeft,
    this.onTapRight,
    this.leftDisabled = false,
  });
  final String? title;
  final String? url;
  final String? content;
  final String? rightText;
  final String? leftText;
  final bool leftDisabled;
  final Function()? onTapLeft;
  final Function()? onTapRight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 280,
            color: Styles.c_FFFFFF,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    title ?? '',
                    style: Styles.ts_0C1C33_17sp,
                  ),
                ),
                Divider(
                  color: Styles.c_E8EAEF,
                  height: 0.5,
                ),
                Row(
                  children: [
                    if (!leftDisabled) ...[
                      _button(
                        bgColor: Styles.c_FFFFFF,
                        text: leftText ?? StrRes.cancel,
                        textStyle: Styles.ts_0C1C33_17sp,
                        onTap: onTapLeft ?? () => Get.back(result: false),
                      ),
                      Container(
                        color: Styles.c_E8EAEF,
                        width: 0.5,
                        height: 48,
                      ),
                    ],
                    _button(
                      bgColor: Styles.c_FFFFFF,
                      text: rightText ?? StrRes.determine,
                      textStyle: Styles.ts_000000_17sp,
                      onTap: onTapRight ?? () => Get.back(result: true),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required TextStyle textStyle,
    Function()? onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(6),
              color: bgColor,
            ),
            height: 48,
            alignment: Alignment.center,
            child: Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ),
      );
}

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    super.key,
    this.dialogTitle,
    this.title,
    this.url,
    this.content,
    this.textAlign,
    this.confirmText,
    this.onConfirm,
    this.onClose,
  });
  final String? dialogTitle;
  final String? title;
  final String? url;
  final String? content;
  final TextAlign? textAlign;
  final String? confirmText;
  final Function()? onConfirm;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 280,
            color: Styles.c_FFFFFF,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        if (dialogTitle != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 12,
                            ),
                            child: Text(
                              dialogTitle!,
                              style:
                                  Styles.ts_000000_20sp_regular_inter_lh1half,
                            ),
                          ),
                        ],
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            right: 25,
                            top: dialogTitle != null ? 8 : 22,
                            bottom: 22,
                          ),
                          child: Text(
                            title ?? '',
                            style: Styles.ts_000000_16sp_regular_inter_lh1half,
                            textAlign: textAlign ?? TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 30,
                      ),
                      child: _button(
                        bgColor: Styles.c_EBC651,
                        text: confirmText ?? StrRes.confirm,
                        textStyle: Styles.ts_886544_16sp_regular_inter,
                        onTap: onConfirm ?? () => Get.back(result: true),
                      ),
                    ),
                  ],
                ),
                if (onClose != null)
                  Positioned(
                    top: 2,
                    right: 2,
                    child: ImageRes.closeBlack2.toImage
                      ..width = 24
                      ..height = 24
                      ..onTap = () {
                        onClose!.call();
                        Get.back(result: false);
                      },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required TextStyle textStyle,
    Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: bgColor,
          ),
          height: 45,
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      );
}

class CloseDialog extends StatelessWidget {
  const CloseDialog({
    super.key,
    this.title,
    this.url,
    this.content,
    this.onTap,
  });
  final String? title;
  final String? url;
  final String? content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 280,
            color: Styles.c_000000_opacity88,
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: 5,
                  child: ImageRes.closeWhite.toImage
                    ..width = 27.15
                    ..height = 25.83
                    ..onTap = onTap ?? () => Get.back(result: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 38,
                    top: 44,
                  ),
                  child: Text(
                    title ?? '',
                    style: Styles.ts_FFFFFF_16sp_regular_inter_lh1half,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required TextStyle textStyle,
    Function()? onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(6),
              color: bgColor,
            ),
            height: 48,
            alignment: Alignment.center,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      );
}

class CustomCloseWidgetDialog extends StatelessWidget {
  const CustomCloseWidgetDialog({
    super.key,
    this.crossAxisAlignment,
    this.width,
    this.onClose,
    required this.child,
  });
  final CrossAxisAlignment? crossAxisAlignment;
  final double? width;
  final Function()? onClose;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: width,
              color: Styles.c_FFFFFF,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 22,
                        ),
                        child: child,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: ImageRes.closeBlack2.toImage
                      ..width = 24
                      ..height = 24
                      ..onTap = onClose ?? () => Get.back(result: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCancelConfirmDialog extends StatelessWidget {
  const CustomCancelConfirmDialog({
    super.key,
    this.dialogTitle,
    this.title,
    this.url,
    this.content,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    required this.onConfirm,
  });
  final String? dialogTitle;
  final String? title;
  final String? url;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final Function()? onCancel;
  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 280,
            color: Styles.c_FFFFFF,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    if (dialogTitle != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 12,
                        ),
                        child: Text(
                          dialogTitle!,
                          style: Styles.ts_000000_20sp_regular_inter_lh1half,
                        ),
                      ),
                    ],
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: dialogTitle != null ? 8 : 22,
                        bottom: 22,
                      ),
                      child: Text(
                        title ?? '',
                        style: Styles.ts_000000_16sp_regular_inter_lh1half,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _button(
                        bgColor: Colors.transparent,
                        text: cancelText ?? StrRes.cancel,
                        textStyle: Styles.ts_EBC651_16sp_regular_inter,
                        borderStyle: Border.all(
                          color: Styles.c_EBC651,
                          width: 1,
                        ),
                        onTap: onCancel ?? () => Get.back(result: true),
                      ),
                      Container(
                        width: 15,
                      ),
                      _button(
                        bgColor: Styles.c_EBC651,
                        text: confirmText ?? StrRes.confirm,
                        textStyle: Styles.ts_886544_16sp_regular_inter,
                        onTap: onConfirm,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required TextStyle textStyle,
    Border? borderStyle,
    Function()? onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: borderStyle,
              borderRadius: BorderRadius.circular(5),
              color: bgColor,
            ),
            height: 45,
            alignment: Alignment.center,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      );
}

class CustomCancelConfirmWidgetDialog extends StatelessWidget {
  const CustomCancelConfirmWidgetDialog({
    super.key,
    this.crossAxisAlignment,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    required this.onConfirm,
    required this.child,
  });
  final CrossAxisAlignment? crossAxisAlignment;
  final String? cancelText;
  final String? confirmText;
  final Function()? onCancel;
  final Function() onConfirm;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 280,
              color: Styles.c_FFFFFF,
              child: Column(
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 22,
                    ),
                    child: child,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _button(
                          bgColor: Colors.transparent,
                          text: cancelText ?? StrRes.cancel,
                          textStyle: Styles.ts_EBC651_16sp_regular_inter,
                          borderStyle: Border.all(
                            color: Styles.c_EBC651,
                            width: 1,
                          ),
                          onTap: onCancel ?? () => Get.back(result: true),
                        ),
                        Container(
                          width: 15,
                        ),
                        _button(
                          bgColor: Styles.c_EBC651,
                          text: confirmText ?? StrRes.confirm,
                          textStyle: Styles.ts_886544_16sp_regular_inter,
                          onTap: onConfirm,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required TextStyle textStyle,
    Border? borderStyle,
    Function()? onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: borderStyle,
              borderRadius: BorderRadius.circular(5),
              color: bgColor,
            ),
            height: 45,
            alignment: Alignment.center,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      );
}
