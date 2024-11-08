import 'package:flutter/material.dart';
import 'package:savera_erp/shared/responsive.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

@immutable
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final String? hintText;
  final ValueChanged<bool>? onBtnClick;
  final VoidCallback? onBtnRefresh;
  final ValueChanged<String>? onQueryChanged;
  final bool showSearchIcon;
  final bool showRefreshIcon;
  final bool showBackButton;
  final double elevation;
  final List<Widget>? actionBtns;

  const SearchAppBar({
    required this.title,
    required this.onBtnClick,
    required this.onQueryChanged,
    this.onBtnRefresh,
    this.showBackButton = true,
    this.showSearchIcon = true,
    this.showRefreshIcon = false,
    this.elevation = 0.5,
    this.subTitle,
    this.actionBtns,
    this.hintText,
    super.key,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  late double fontSize = 14;
  late bool isSearching = false;

  void resetBackToNormal() => setState(() {
        widget.onBtnClick!(false);
        isSearching = !isSearching;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      // backgroundColor: isSearching ? Colors.white : colorScheme.primary,
      // brightness: isSearching ? Brightness.light : Brightness.dark,
      elevation: isSearching ? 4 : widget.elevation,
      iconTheme: IconThemeData(color: Colors.black),
      // leading: widget.showBackButton
      //     ? IconButton(
      //         icon: Icon(
      //           Icons.arrow_back,
      //           color: Colors.black,
      //         ),
      //         onPressed: () => RouteHelper.pop(context),
      //         // onPressed: () => Navigator.pop(context),
      //       )
      //     : null,
      leading: null,
      title: isSearching
          ? TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText ?? "Search",
                hintStyle: AppStyles.getTextStyle(false, fontSize),
              ),
              onChanged: widget.onQueryChanged,
              style: AppStyles.getTextStyle(
                false,
                Responsive.getSize(fontSize, context),
              ),
            )
          : _getDisplayTitle(
              widget.title,
              subTitle: widget.subTitle,
            ),
      actions: widget.showSearchIcon
          ? [
              if (widget.showRefreshIcon) refreshing(),
              searching(),
              if (widget.actionBtns != null && !isSearching)
                ...widget.actionBtns!,
            ]
          : widget.actionBtns,
    );
  }

  Widget _getDisplayTitle(
    String title, {
    String? subTitle,
  }) {
    return subTitle == null
        ? DxText(title, fontSize: fontSize, bold: true)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DxText(title, fontSize: fontSize, bold: true),
              SizedBox(height: 3),
              DxText(subTitle, fontSize: fontSize * 0.8)
            ],
          );
  }

  IconButton searching() {
    return isSearching
        ? IconButton(
            icon: const Icon(Icons.clear, color: Colors.black),
            onPressed: () => resetBackToNormal(),
          )
        : IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.black,
            ),
            onPressed: () {
              setState(() => isSearching = !isSearching);
              if (widget.onBtnClick != null) {
                widget.onBtnClick!(isSearching);
              }
            },
          );
  }

  IconButton refreshing() {
    return IconButton(
        icon: Icon(
          Icons.refresh,
          color: AppColors.black,
        ),
        onPressed: () {
          setState(() {
            if (widget.onBtnRefresh != null) {
              widget.onBtnRefresh!();
            }
          });
          // setState(() => isSearching = !isSearching);
          // if (widget.onBtnClick != null) {
          //   widget.onBtnClick!(isSearching);
          // }
        });
  }
}
