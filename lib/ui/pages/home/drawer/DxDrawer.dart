import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/dx_logo.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DxDrawer extends StatefulWidget {
  final void Function(int, ItemData) onItemTapped;
  final List<ItemData> menus;

  const DxDrawer({
    required this.menus,
    required this.onItemTapped,
    super.key,
  });

  @override
  State<DxDrawer> createState() => _DxDrawerState();
}

class _DxDrawerState extends State<DxDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(5.0),
      padding: EdgeInsets.zero,
      child: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.white,
            width: 0,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: DxLogo(height: 25),
                    ),
                  ),
                  CloseButton(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ItemsGroup(
                    id: 0,
                    onTapped: widget.onItemTapped,
                    items: [
                      ItemData(
                        id: 0,
                        title: 'Welcome Shivam',
                        route: '',
                      ),
                    ],
                    borderColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: 10),
                  ItemsGroup(
                    id: 1,
                    onTapped: widget.onItemTapped,
                    items: widget.menus,
                    borderColor: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              child: DxText('Version 1.0.0', fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class ItemsGroup extends StatelessWidget {
  final List<ItemData> items;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final int id;
  final void Function(int, ItemData)? onTapped;

  const ItemsGroup({
    super.key,
    required this.items,
    required this.id,
    required this.onTapped,
    this.borderColor = Colors.grey,
    this.borderRadius = 10,
    this.borderWidth = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: items.map((e) {
          return ItemView(
            item: e,
            onTapped: (item) => onTapped?.call(id, item),
          );
        }).toList(),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final ItemData item;
  final ValueChanged<ItemData> onTapped;

  const ItemView({
    super.key,
    required this.item,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    if (item.items.isNotEmpty)
      return ExpansionTile(
        title: DxText(item.title),
        textColor: Colors.black,
        // collapsedIconColor: Colors.blue,
        leading: item.leading,
        trailing: item.trailing,
        children: item.items.map((e) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ItemView(
              item: e,
              onTapped: onTapped,
            ),
          );
        }).toList(),
      );
    return ListTile(
      title: DxText(item.title),
      onTap: () => onTapped.call(item),
      leading: item.leading,
      trailing: item.trailing,
    );
  }
}

class ItemData {
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String route;
  final List<ItemData> items;
  final int id;

  ItemData({
    required this.id,
    required this.title,
    required this.route,
    this.leading,
    this.trailing,
    this.items = const [],
  });
}
