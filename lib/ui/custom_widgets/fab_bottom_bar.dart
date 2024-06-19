import 'package:flutter/material.dart';

class AppBarItem {
  AppBarItem({required this.icon, required this.text});

  IconData icon;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  final List<AppBarItem> items;

  final double height;
  final double iconSize;
  final Color backgroundColor;

  final Color? color;

  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  FABBottomAppBar({
    super.key,
    required this.items,
    required this.onTabSelected,
    this.height = 60,
    this.iconSize = 25.0,
    this.backgroundColor = Colors.white,
    this.color,
    this.selectedColor,
    this.notchedShape,
  }) {
    //assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    //items.insert(items.length >> 1, _buildMiddleTabItem());
    return Container(
      color: Theme.of(context).primaryColor,
      // margin: EdgeInsets.all(6),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(55),
      //   color: Theme.of(context).primaryColor,
      // ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    AppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color? color =
        _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index!),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    item!.icon,
                    color: color,
                    size: widget.iconSize,
                  ),
                  //                SizedBox(
                  //                  height: widget.iconSize,
                  //                  width: widget.iconSize,
                  //                  child: item.iconData,
                  //                ),
                  Text(
                    item.text,
                    style: TextStyle(color: color, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
