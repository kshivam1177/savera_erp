import 'package:flutter/material.dart';
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
  ItemData? _selectedItem;

  void _onItemTapped(ItemData item) {
    _selectedItem = item;
    widget.onItemTapped(item);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.white,
            width: 0,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: DxLogo(height: 30),
            ),
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
              items: [
                ItemData(
                  title: 'Dashboard',
                  route: '/home',
                  leading: Icon(Icons.dashboard, size: 20),
                  onTap: (item) {
                    _onItemTapped(item);
                    Navigator.pop(context);
                  },
                ),
                ItemData(
                  title: 'Profile',
                  route: '/profile',
                  leading: Icon(Icons.person, size: 20),
                  onTap: (item) {
                    _onItemTapped(item);
                    Navigator.pop(context);
                  },
                ),
                ItemData(
                  title: 'Settings',
                  route: '/settings',
                  leading: Icon(Icons.settings, size: 20),
                  onTap: (item) {
                    _onItemTapped(item);
                    Navigator.pop(context);
                  },
                  items: [
                    ItemData(
                      title: 'General',
                      route: '/settings/general',
                      leading: Icon(Icons.settings, size: 20),
                      onTap: (item) {
                        _onItemTapped(item);
                        Navigator.pop(context);
                      },
                    ),
                    ItemData(
                      title: 'Security',
                      route: '/settings/security',
                      leading: Icon(Icons.security, size: 20),
                      onTap: (item) {
                        _onItemTapped(item);
                        Navigator.pop(context);
                      },
                      items: [
                        ItemData(
                          title: 'Change Password',
                          route: '/settings/security/change-password',
                          leading: Icon(Icons.lock, size: 20),
                          onTap: (item) {
                            _onItemTapped(item);
                            Navigator.pop(context);
                          },
                        ),
                        ItemData(
                          title: 'Two Factor Authentication',
                          route: '/settings/security/two-factor-auth',
                          leading: Icon(Icons.verified_user, size: 20),
                          onTap: (item) {
                            _onItemTapped(item);
                            Navigator.pop(context);
                          },
                          items: [
                            ItemData(
                              title: 'Enable',
                              route:
                                  '/settings/security/two-factor-auth/enable',
                              leading: Icon(Icons.verified_user, size: 20),
                              onTap: (item) {
                                _onItemTapped(item);
                                Navigator.pop(context);
                              },
                            ),
                            ItemData(
                              title: 'Disable',
                              route:
                                  '/settings/security/two-factor-auth/disable',
                              leading: Icon(Icons.verified_user, size: 20),
                              onTap: (item) {
                                _onItemTapped(item);
                                Navigator.pop(context);
                              },
                              items: [
                                ItemData(
                                  title: 'Confirm',
                                  route:
                                      '/settings/security/two-factor-auth/disable/confirm',
                                  leading: Icon(Icons.verified_user, size: 20),
                                  onTap: (item) {
                                    _onItemTapped(item);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              borderColor: Colors.grey.shade300,
            ),
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
