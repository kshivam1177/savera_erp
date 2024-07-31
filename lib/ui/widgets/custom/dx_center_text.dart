import 'package:flutter/widgets.dart';

import 'text/dx_text.dart';

@immutable
class DxCenterText extends StatelessWidget {
  final String text;

  const DxCenterText({
    super.key,
    this.text = "Record not found",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DxText(
        text,
        fontSize: 18,
      ),
    );
  }
}
