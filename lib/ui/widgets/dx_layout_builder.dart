import 'package:flutter/material.dart';

enum DxLayoutType {
  mobile,
  tab,
  smallTab,
  desktop;

  String toString() {
    String n = this.name.toLowerCase();
    return "${n[0].toUpperCase()}${n.substring(1)}";
  }
}

class DxLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext, DxLayoutType) buildView;

  const DxLayoutBuilder({
    super.key,
    required this.buildView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = MediaQuery.sizeOf(context).width;
        if (maxWidth < 600) {
          return buildView(context, DxLayoutType.mobile);
        } else if (maxWidth < 900) {
          return buildView(context, DxLayoutType.smallTab);
        } else if (maxWidth < 1200) {
          return buildView(context, DxLayoutType.tab);
        } else {
          return buildView(context, DxLayoutType.desktop);
        }
      },
    );
  }
}
