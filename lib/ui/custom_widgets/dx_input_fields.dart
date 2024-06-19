import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DxInputText extends StatefulWidget {
  final String hintText;
  final String valueText;
  final String? errorText;
  final Function()? onClick;
  final Function(String)? onChanged;
  final bool enabled;

  final Widget? sufixIcon;
  final TextEditingController? controller;
  final bool isEditable;
  final bool isUnderLine;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final bool showDefaultPrefixIcon;
  final double? hintTextSize;
  final bool autofocus;
  final bool obscureText;
  final bool isPreSelectedTextMode;
  final bool readOnly;

  DxInputText({
    super.key,
    required this.hintText,
    required this.valueText,
    required this.controller,
    this.onClick,
    this.hintTextSize,
    this.onChanged,
    this.readOnly = false,
    this.sufixIcon,
    this.enabled = true,
    this.isEditable = true,
    this.isUnderLine = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.showDefaultPrefixIcon = false,
    this.prefixIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.isPreSelectedTextMode = false,
    this.errorText,
  }) {
//it will make sure cursor is at the last position.

    if (valueText.isNotEmpty) {
      controller!.value = TextEditingValue(
        text: valueText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: valueText.length),
        ),
      );
    } else {
      debugPrint("BLANK CASE");
    }
    // controller.value = TextEditingValue(
    //   text: valueText ?? "",
    //   selection: TextSelection.fromPosition(
    //     TextPosition(offset: valueText?.length ?? 0),
    //   ),
    // );

//Enable this to show text field initially selected all text.
  }

  @override
  State<DxInputText> createState() => _DxInputTextState();
}

class _DxInputTextState extends State<DxInputText> {
  // FocusNode _focusNode;
  // @override
  // void initState() {
  //   super.initState();
  //   _focusNode = FocusNode();
  //
  //   _focusNode.addListener(() {
  //     if (_focusNode.hasFocus && widget.isPreSelectedTextMode) {
  //       widget.controller.selection = TextSelection(
  //         baseOffset: 0,
  //         extentOffset: widget.valueText.length,
  //       );
  //     }
  //
  //     print("FocusOn=>${widget.hintText} => ${_focusNode.hasFocus}");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
//key: Key(this.hintText),
      ignoring: !widget.isEditable,
      child: InkWell(
        onTap: widget.onClick,
        child: TextFormField(
          obscureText: widget.obscureText,
          // focusNode: _focusNode,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          validator: widget.validator,
          minLines: widget.minLines,
          keyboardType: widget.maxLines > 1
              ? TextInputType.multiline
              : widget.keyboardType,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          onSaved: (v) {},
          onChanged: (query) {
            if (widget.onChanged != null) {
              widget.onChanged!(query);
            }
          },
          style: AppStyles.getTextStyle(false, 16),
          decoration: widget.isUnderLine
              ? InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                )
              : dxTextFieldDecoration(
                  context,
                  hintTextSize: widget.hintTextSize,
                  showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
                  hint: widget.hintText,
                  textSize: 14,
                  radius: 3,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.sufixIcon,
                  errorText: widget.errorText,
                ),
        ),
      ),
    );
  }
}
