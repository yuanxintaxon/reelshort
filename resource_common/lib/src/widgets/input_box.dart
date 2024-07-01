import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

enum InputBoxType {
  phone,
  email,
  username,
  account,
  password,
  verificationCode,
  invitationCode,
  general,
  number,
}

class InputBox extends StatefulWidget {
  const InputBox.phone({
    super.key,
    this.label,
    required this.code,
    this.onAreaCode,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.codeStyle,
    this.hintStyle,
    this.formatHintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = null,
        type = InputBoxType.phone,
        arrowColor = null,
        clearBtnColor = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.password({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.formatHintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = true,
        autoFocus = true,
        height = null,
        type = InputBoxType.password,
        codeStyle = null,
        code = '',
        arrowColor = null,
        clearBtnColor = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        onAreaCode = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = true,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.passwordSimple({
    super.key,
    this.label,
    this.onForgotPassword,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.formatHintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = true,
        autoFocus = true,
        height = null,
        type = InputBoxType.password,
        codeStyle = null,
        code = '',
        arrowColor = null,
        clearBtnColor = null,
        onSendVerificationCode = null,
        onAreaCode = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.verificationCode({
    super.key,
    this.label,
    this.onSendVerificationCode,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.formatHintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = null,
        type = InputBoxType.verificationCode,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        arrowColor = null,
        clearBtnColor = null,
        onForgotPassword = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.invitationCode({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = null,
        type = InputBoxType.invitationCode,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.email({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = null,
        type = InputBoxType.email,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.username({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = null,
        type = InputBoxType.username,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.clubName({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = 32,
        type = InputBoxType.general,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.general({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = 32,
        type = InputBoxType.general,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.editInfo({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = 60,
        type = InputBoxType.general,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = ImageRes.closeBlack,
        clearIconSize = 60;

  const InputBox.editRemark({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = 60,
        type = InputBoxType.general,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = ImageRes.closeBlack,
        clearIconSize = 60;

  const InputBox.customTag({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
  })  : obscureText = false,
        autoFocus = true,
        height = 32,
        type = InputBoxType.general,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        showClearButton = true,
        clearIcon = null,
        clearIconSize = null;

  const InputBox.number({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.formatHintStyle,
    this.hintStyle,
    this.hintText,
    this.formatHintText,
    this.margin,
    this.inputFormatters,
    this.counterText,
    this.showClearButton = true,
  })  : obscureText = false,
        autoFocus = true,
        height = 32,
        type = InputBoxType.number,
        code = '',
        codeStyle = null,
        onAreaCode = null,
        onSendVerificationCode = null,
        onForgotPassword = null,
        arrowColor = null,
        clearBtnColor = null,
        textAlign = TextAlign.start,
        sleekStyle = true,
        showEye = false,
        clearIcon = null,
        clearIconSize = null;

  const InputBox({
    super.key,
    this.label,
    this.height,
    this.autoFocus = true,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.codeStyle,
    this.formatHintStyle,
    this.code = '+1',
    this.hintText,
    this.formatHintText,
    this.arrowColor,
    this.clearBtnColor,
    this.obscureText = false,
    this.type = InputBoxType.account,
    this.onAreaCode,
    this.onSendVerificationCode,
    this.onForgotPassword,
    this.margin,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.sleekStyle = false,
    this.showEye = false,
    this.showClearButton = true,
    this.clearIcon,
    this.clearIconSize,
    this.counterText,
  });
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? codeStyle;
  final TextStyle? formatHintStyle;
  final String code;
  final String? label;
  final double? height;
  final bool autoFocus;
  final String? hintText;
  final String? formatHintText;
  final Color? arrowColor;
  final Color? clearBtnColor;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputBoxType type;
  final Function()? onAreaCode;
  final Future<bool> Function()? onSendVerificationCode;
  final void Function()? onForgotPassword;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final bool sleekStyle;
  final bool showEye;
  final bool showClearButton;
  final String? counterText;
  final String? clearIcon;
  final double? clearIconSize;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  late bool _obscureText;
  bool _showClearBtn = false;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    widget.controller?.addListener(_onChanged);
    super.initState();
  }

  void _onChanged() {
    setState(() {
      _showClearBtn = widget.controller!.text.isNotEmpty;
    });
  }

  void _toggleEye() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  BoxDecoration _buildBottomBorder() => BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Styles.c_E8EAEF, width: 1),
        ),
      );

  BoxDecoration _buildAllBorder() => BoxDecoration(
        border: Border.all(color: Styles.c_E8EAEF, width: 1),
        borderRadius: BorderRadius.circular(8),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: widget.labelStyle ?? Styles.ts_8E9AB0_12sp,
            ),
            0.vSpace,
          ],
          Container(
            height: widget.height ?? 42,
            padding:
                EdgeInsets.only(left: (widget.sleekStyle) ? 0 : 12, right: 8),
            decoration:
                (widget.sleekStyle) ? _buildBottomBorder() : _buildAllBorder(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.type == InputBoxType.phone) _areaCodeView,
                _textField,
                if (widget.showClearButton) _clearBtn,
                _counterView,
                _eyeBtn,
                if (widget.type == InputBoxType.verificationCode)
                  VerifyCodedButton(
                    onTapCallback: widget.onSendVerificationCode,
                  ),
                if (widget.type == InputBoxType.password &&
                    widget.onForgotPassword != null)
                  ForgotPasswordButton(
                    onTapCallback: widget.onForgotPassword,
                  ),
              ],
            ),
          ),
          if (null != widget.formatHintText)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: widget.formatHintText!.toText
                ..style = (widget.formatHintStyle ?? Styles.ts_8E9AB0_12sp),
            ),
        ],
      ),
    );
  }

  Widget get _textField => Expanded(
        child: TextField(
          textAlign: widget.textAlign,
          controller: widget.controller,
          keyboardType: _textInputType,
          textInputAction: TextInputAction.next,
          style: widget.textStyle ?? Styles.ts_0C1C33_17sp,
          autofocus: widget.autoFocus,
          obscureText: _obscureText,
          inputFormatters: [
            if (widget.type == InputBoxType.phone ||
                widget.type == InputBoxType.verificationCode)
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            if (null != widget.inputFormatters) ...widget.inputFormatters!,
          ],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? Styles.ts_8E9AB0_17sp,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
          ),
        ),
      );

  Widget get _areaCodeView => GestureDetector(
        onTap: widget.onAreaCode,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.code,
              style: widget.codeStyle ?? Styles.ts_0C1C33_17sp,
            ),
            8.hSpace,
            ImageRes.downArrTriangleBlack.toImage
              ..width = 20
              ..height = 20,
            Container(
              width: 1,
              height: 26,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Styles.c_E8EAEF,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      );

  Widget get _clearBtn => Visibility(
        visible: _showClearBtn,
        child: GestureDetector(
          onTap: () {
            widget.controller?.clear();
          },
          behavior: HitTestBehavior.translucent,
          child: (widget.clearIcon ?? ImageRes.clearText).toImage
            ..width = widget.clearIconSize ?? 24
            ..height = widget.clearIconSize ?? 24,
        ),
      );

  Widget get _counterView => Visibility(
        visible: widget.counterText != null && widget.counterText!.isNotEmpty,
        child: "${widget.counterText}".toText
          ..style = Styles.ts_8E8E8E_14sp_regular,
      );

  Widget get _eyeBtn => Visibility(
        visible: widget.type == InputBoxType.password && widget.showEye == true,
        child: GestureDetector(
          onTap: _toggleEye,
          behavior: HitTestBehavior.translucent,
          child: (_obscureText
              ? ImageRes.eyeClose.toImage
              : ImageRes.eyeOpen.toImage)
            ..width = 24
            ..height = 24,
        ),
      );

  TextInputType? get _textInputType {
    TextInputType? keyboardType;
    switch (widget.type) {
      case InputBoxType.phone:
        keyboardType = TextInputType.phone;
        break;
      case InputBoxType.email:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.username:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.account:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.password:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.verificationCode:
        keyboardType = TextInputType.number;
        break;
      case InputBoxType.invitationCode:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.general:
        keyboardType = TextInputType.text;
        break;
      case InputBoxType.number:
        keyboardType = TextInputType.number;
        break;
    }
    return keyboardType;
  }
}

class VerifyCodedButton extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int seconds;

  /// 用户点击时的回调函数。
  final Future<bool> Function()? onTapCallback;

  const VerifyCodedButton({
    super.key,
    this.seconds = 300,
    required this.onTapCallback,
  });

  @override
  State<VerifyCodedButton> createState() => _VerifyCodedButtonState();
}

class _VerifyCodedButtonState extends State<VerifyCodedButton> {
  Timer? _timer;
  late int _seconds;
  bool _firstTime = true;

  @override
  void dispose() {
    _cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _seconds = widget.seconds;
  }

  void _start() {
    _firstTime = false;
    _timer = Timer.periodic(1.seconds, (timer) {
      if (!mounted) return;
      if (_seconds == 0) {
        _cancel();
        setState(() {});
        return;
      }
      _seconds--;
      setState(() {});
    });
  }

  void _cancel() {
    if (null != _timer) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _reset() {
    if (_seconds != widget.seconds) {
      _seconds = widget.seconds;
    }
    _cancel();
    setState(() {});
  }

  void _restart() {
    _reset();
    _start();
  }

  bool get _isEnabled => _seconds == 0 || _firstTime;

  @override
  Widget build(BuildContext context) =>
      (_isEnabled ? StrRes.sendVerificationCode : '${_seconds}S').toText
        ..style = Styles.ts_000000_17sp
        ..onTap = () {
          if (_isEnabled) {
            widget.onTapCallback?.call().then((start) {
              if (start) _restart();
            });
          }
        };
}

class ForgotPasswordButton extends StatelessWidget {
  final void Function()? onTapCallback;

  const ForgotPasswordButton({super.key, required this.onTapCallback});

  @override
  Widget build(BuildContext context) => StrRes.forgetPassword.toText
    ..style = Styles.ts_8E8E8E_22sp_regular_montserrat
    ..onTap = () => onTapCallback?.call();
}
