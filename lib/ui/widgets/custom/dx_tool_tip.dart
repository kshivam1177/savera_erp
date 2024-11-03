import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DxToolTip extends StatelessWidget {
  final Widget child;
  final String? tooltip;

  const DxToolTip({
    super.key,
    required this.tooltip,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      textStyle: AppStyles.getTextStyle(false, 12, color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.black.shade300,
        borderRadius: BorderRadius.circular(50),
      ),
      child: child,
    );
  }
}
