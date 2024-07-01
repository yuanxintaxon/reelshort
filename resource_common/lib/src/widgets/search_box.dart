import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.icon,
    this.searchIconColor,
    this.backgroundColor,
    this.searchIconHeight,
    this.searchIconWidth,
    this.margin,
    this.padding,
    this.enabled = false,
    this.autofocus = false,
    this.isPreview = false,
    this.height,
    this.onSubmitted,
    this.onCleared,
    this.onChanged,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final String? hintText;
  final String? icon;
  final Color? searchIconColor;
  final Color? backgroundColor;
  final double? searchIconWidth;
  final double? searchIconHeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final bool autofocus;
  final bool isPreview;
  final double? height;
  final Function(String)? onSubmitted;
  final Function()? onCleared;
  final ValueChanged<String>? onChanged;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool _showClearBtn = false;

  @override
  void initState() {
    widget.controller?.addListener(() {
      setState(() {
        _showClearBtn = widget.controller!.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // for display ONlY
    Widget searchBoxPreview() {
      return Container(
        height: widget.height ?? 36,
        margin: widget.margin,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Styles.c_8E9AB0_opacity15,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (widget.icon ?? ImageRes.searchGrey).toImage
              ..color = widget.searchIconColor
              ..width = widget.searchIconWidth ?? 18
              ..height = widget.searchIconHeight ?? 18,
            8.hSpace,
            Text(widget.hintText ?? StrRes.search,
                style: widget.hintStyle ?? Styles.ts_8E9AB0_17sp),
          ],
        ),
      );
    }

    Widget searchBoxField() {
      return Container(
        height: widget.height ?? 36,
        margin: widget.margin,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Styles.c_8E9AB0_opacity15,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            (widget.icon ?? ImageRes.searchGrey).toImage
              ..color = widget.searchIconColor
              ..width = widget.searchIconWidth ?? 18
              ..height = widget.searchIconHeight ?? 18,
            8.hSpace,
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: widget.textStyle ?? Styles.ts_0C1C33_17sp,
                autofocus: widget.autofocus,
                enabled: widget.enabled,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: widget.hintText ?? StrRes.search,
                  hintStyle: widget.hintStyle ?? Styles.ts_8E9AB0_17sp,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
                onSubmitted: widget.onSubmitted,
                onChanged: widget.onChanged,
              ),
            ),
            if (_showClearBtn) _clearBtn,
          ],
        ),
      );
    }

    return (widget.isPreview == true) ? searchBoxPreview() : searchBoxField();
  }

  Widget get _clearBtn => Visibility(
        visible: _showClearBtn,
        child: GestureDetector(
          onTap: () {
            widget.controller?.clear();
            widget.onCleared?.call();
          },
          behavior: HitTestBehavior.translucent,
          child: ImageRes.clearText.toImage
            ..width = widget.searchIconWidth ?? 24
            ..height = widget.searchIconHeight ?? 24
            ..color = widget.searchIconColor,
        ),
      );
}
