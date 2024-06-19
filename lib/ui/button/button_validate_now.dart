import 'package:flutter/material.dart';
import 'package:savera_erp/ui/custom_widgets/dx_text.dart';

class BtnValidateNow extends StatelessWidget {
  final VoidCallback onTap;

  const BtnValidateNow({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.secondary.withOpacity(0.07),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        Icons.check,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: const DxTextGreen("Validate"),
    );
  }
}
