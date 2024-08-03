import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DxIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final String? tooltip;

  const DxIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      textStyle: AppStyles.getTextStyle(false, 12,color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.black.shade300,
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          child: icon,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
