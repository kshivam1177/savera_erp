import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DxTextFormFieldV2 extends StatelessWidget {
  final String hintText;
  final String valueText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  late int minLines;
  late int maxLines;
  final double? hintTextSize;
  final double inputTextSize;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color disabledFillColor;

  final bool? enabled;
  late bool autofocus;
  late bool isEditable;
  late bool isUnderLine;
  late bool isPreSelectedTextMode;
  final bool sampleInputRebuildRequired; //sample input rebuild required.
  late TextInputType keyboardType;
  final AutovalidateMode? autoValidateMode;

  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onClick;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  TextEditingController? controller;
  FocusNode? _focusNode;

  DxTextFormFieldV2({
    required this.hintText,
    this.valueText = "",
    this.onClick,
    this.hintTextSize,
    this.onChanged,
    this.enabled = true,
    this.isEditable = true,
    this.isUnderLine = false,
    this.autoValidateMode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.isPreSelectedTextMode = false,
    this.sampleInputRebuildRequired = false,
    this.inputTextSize = 14,
    this.borderRadius = 4,
    this.borderWidth = 1.2,
    this.borderColor = Colors.black45,
    this.disabledFillColor = Colors.black12,
    super.key,
  }) {
    _prepareController();
  }

  void _prepareController() {
    controller ??= TextEditingController(text: valueText);
    controller!.value = TextEditingValue(
      text: valueText,
      selection: (autofocus && isPreSelectedTextMode)
          ? TextSelection(baseOffset: 0, extentOffset: valueText.length)
          : TextSelection.fromPosition(TextPosition(offset: valueText.length)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (sampleInputRebuildRequired) {
      _prepareController();
    }
    return IgnorePointer(
      ignoring: !isEditable,
      child: InkWell(
        onTap: onClick,
        child: TextFormField(
          onTap: isPreSelectedTextMode ? controller?.selectAll : null,
          autovalidateMode: autoValidateMode,
          focusNode: _focusNode,
          autofocus: autofocus,
          validator: validator,
          minLines: minLines,
          keyboardType: maxLines > 1 ? TextInputType.multiline : keyboardType,
          controller: controller,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          enabled: enabled,
          onChanged: onChanged,
          style: AppStyles.getTextStyle(false, inputTextSize),
          decoration: isUnderLine
              ? InputDecoration(
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                )
              : dxTextFieldDecoration(
                  context,
                  hintTextSize: hintTextSize,
                  // showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
                  hint: hintText,
                  textSize: 14,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  errorText: null,
                  radius: borderRadius,
                  borderWidth: borderWidth,
                  borderColor: borderColor,
                  fillColor:
                      isEditable ? Colors.transparent : disabledFillColor,
                ),
        ),
      ),
    );
  }
}

extension _TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}
