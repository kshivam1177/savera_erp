import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/ui/pages/attendance/pg_attendance.dart';
import 'package:savera_erp/ui/widgets/custom/dx_logo.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DxDrawer extends StatefulWidget {
  final ValueChanged<ItemData> onItemTapped;

  const DxDrawer({
    required this.onItemTapped,
    super.key,
  });

  @override
  State<DxDrawer> createState() => _DxDrawerState();
}

class _DxDrawerState extends State<DxDrawer> {
  // ItemData? _selectedItem;
  List<ItemData> menus = [];

  void _onItemTapped(ItemData item) {
    // _selectedItem = item;
    widget.onItemTapped(item);
    // setState(() {});
  }

  @override
  void initState() {
    menus = [
      ItemData(
        title: 'Home',
        route: '/home',
        leading: Icon(CupertinoIcons.home, size: 20),
        onTap: (item) {
          _onItemTapped(item);
          Navigator.pop(context);
        },
      ),
      ItemData(
        title: 'Attendance',
        route: PgAttendance.routeName,
        leading: Icon(CupertinoIcons.checkmark_rectangle, size: 20),
        onTap: (item) {
          _onItemTapped(item);
          Navigator.pop(context);
        },
      ),
      ItemData(
        title: 'Tracking',
        route: '/tracking',
        leading: Icon(Icons.location_on_outlined, size: 25),
        onTap: (item) {
          _onItemTapped(item);
          Navigator.pop(context);
        },
      ),
      ItemData(
        title: 'Profile',
        route: '/profile',
        leading: Icon(CupertinoIcons.person, size: 20),
        onTap: (item) {
          _onItemTapped(item);
          Navigator.pop(context);
        },
      ),
      ItemData(
        title: 'Settings',
        route: '/settings',
        leading: Icon(CupertinoIcons.settings, size: 20),
        onTap: (item) {
          _onItemTapped(item);
          Navigator.pop(context);
        },
        items: [
          ItemData(
            title: 'General',
            route: '/settings/general',
            leading: Icon(CupertinoIcons.square_grid_2x2, size: 20),
            onTap: (item) {
              _onItemTapped(item);
              Navigator.pop(context);
            },
          ),
          ItemData(
            title: 'Tracking',
            route: '/settings/tracking',
            leading: Icon(CupertinoIcons.location, size: 20),
            onTap: (item) {
              _onItemTapped(item);
              Navigator.pop(context);
            },
          ),
        ],
      )
    ];
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
                    items: [
                      ItemData(
                        title: 'Welcome Shivam',
                        route: '',
                      ),
                    ],
                    borderColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: 10),
                  ItemsGroup(
                    items: menus,
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

  const ItemsGroup({
    super.key,
    required this.items,
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
        children: items.map((e) => ItemView(item: e)).toList(),
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

  const ItemView({super.key, required this.item});

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
            child: ItemView(item: e),
          );
        }).toList(),
      );
    return ListTile(
      title: DxText(item.title),
      onTap: item.onTap == null ? null : () => item.onTap!.call(item),
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
  final ValueSetter<ItemData>? onTap;
  final List<ItemData> items;

  ItemData({
    required this.title,
    required this.route,
    this.leading,
    this.trailing,
    this.onTap,
    this.items = const [],
  });
}
