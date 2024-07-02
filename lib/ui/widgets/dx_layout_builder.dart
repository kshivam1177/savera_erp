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
  final Widget Function(BuildContext) buildMobileView;
  final Widget Function(BuildContext) buildTabView;
  final Widget Function(BuildContext) buildSmallTabView;
  final Widget Function(BuildContext) buildDesktopView;
  final ValueSetter<DxLayoutType>? deviceNotifier;

  const DxLayoutBuilder({
    super.key,
    required this.buildMobileView,
    required this.buildTabView,
    required this.buildSmallTabView,
    required this.buildDesktopView,
    this.deviceNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = MediaQuery.of(context).size.width;
        if (maxWidth < 600) {
          deviceNotifier?.call(DxLayoutType.mobile);
          return buildMobileView(context);
        } else if (maxWidth < 900) {
          deviceNotifier?.call(DxLayoutType.smallTab);
          return buildSmallTabView(context);
        } else if (maxWidth < 1200) {
          deviceNotifier?.call(DxLayoutType.tab);
          return buildTabView(context);
        } else {
          deviceNotifier?.call(DxLayoutType.desktop);
          return buildDesktopView(context);
        }
      },
    );
  }
}
