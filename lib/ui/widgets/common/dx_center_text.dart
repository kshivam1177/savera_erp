import 'package:flutter/widgets.dart';

import '../custom/text/dx_text.dart';

@immutable
class DxCenterText extends StatelessWidget {
  final String? displayText;

  const DxCenterText({super.key, this.displayText = "Record not found"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DxText(
        displayText!,
        fontSize: 18,
      ),
    );
  }
}
