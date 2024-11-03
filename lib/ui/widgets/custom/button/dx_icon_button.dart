import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/dx_tool_tip.dart';

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
    return DxToolTip(
      tooltip: tooltip,
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
