import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/chips/single_selection_chip.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/custom/input/dx_text_form_field.dart';

typedef DataBuilder<T> = List<T> Function();
typedef ObjMapper<T> = SingleSelectionModel<T> Function(T);

@immutable
class DxDropDownV2<T> extends StatelessWidget {
  DxDropDownV2({
    super.key,
    required this.dataBuilder,
    required this.objectMapper,
    required this.hint,
    this.enabled = true,
    this.child,
    this.suffix,
    this.prefix,
    this.isSemiBold,
    this.initialSelected,
    this.onSelected,
    this.onTap,
    this.heroKey = "",
    this.borderColor = Colors.black45,
    this.fillColor = Colors.white,
    this.borderRadius = 4,
  }) {
    if (heroKey.isEmpty) {
      heroKey = hint;
    }
  }

  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? child;
  final bool? isSemiBold;
  final Color borderColor;
  final Color fillColor;
  final double borderRadius;

  final String hint;
  final ValueChanged<T>? onSelected;
  final VoidCallback? onTap;

  final DataBuilder<T> dataBuilder;

  final ObjMapper<T> objectMapper;
  final T? initialSelected;
  SingleSelectionModel<T>? selectedData;
  String heroKey;

  final _mappedModels = <SingleSelectionModel<T>>[];
  final _titleChangeNotifier = ValueNotifier<String>("");
  late int _selectedIndex = -1;

  double getHeight(double screenHeight, int itemCount) {
    switch (itemCount) {
      case 1:
      case 2:
        return screenHeight * 0.25;
      case 3:
        return screenHeight * 0.34;
      case 4:
        return screenHeight * 0.40;
      case 5:
        return screenHeight * 0.44;
      case 6:
        return screenHeight * 0.51;
      case 7:
        return screenHeight * 0.58;
      case 9:
        return screenHeight * 0.65;
      case 11:
        return screenHeight * 0.75;
      default:
        return screenHeight * 0.82;
    }
  }

  double getWidth(double screenWidth, int itemCount) {
    if (screenWidth > 500) {
      return 500;
    } else {
      return screenWidth - 10;
    }
  }

  void _prepareData() {
    _mappedModels.clear();
    final allItems = dataBuilder();
    for (int v = 0; v < allItems.length; v++) {
      final converted = objectMapper(allItems[v]);
      converted.leadingIcon ??= prefix;
      if (converted.id == selectedData?.id) {
        _selectedIndex = v;
      }
      _mappedModels.add(converted);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (initialSelected != null) {
      selectedData = objectMapper(initialSelected as T);
      _titleChangeNotifier.value = selectedData?.title ?? "";
    }
    return InkWell(
      onTap: !enabled
          ? null
          : () {
              _prepareData();
              if (_mappedModels.isEmpty) {
                onTap?.call();
                return;
              }
              FocusManager.instance.primaryFocus!.unfocus();

              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                elevation: 4.0,
                context: context,
                backgroundColor: Colors.transparent,
                builder: _buildBottomSheetBody,
              );
            },
      child: child ??
          DxTextFormFieldV2(
            valueText: _titleChangeNotifier.value,
            prefixIcon: prefix,
            disabledFillColor: fillColor,
            borderColor: borderColor,
            suffixIcon: suffix ??
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 24,
                ),
            isEditable: false,
            hintText: hint,
            borderRadius: borderRadius,
            // initialValue: selectedData?.title ?? "",
          ),
    );
  }

  Widget _buildBottomSheetBody(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ScrollController controller = ScrollController(
      initialScrollOffset:
          _selectedIndex < 0 ? 0 : _selectedIndex * kToolbarHeight,
    );
    return Hero(
      tag: heroKey,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.black87),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: getWidth(screenWidth, _mappedModels.length),
          height: getHeight(screenHeight, _mappedModels.length),
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: ListTile(
                  title: DxTextBlack(
                    "$hint (${_mappedModels.length})",
                    bold: true,
                    fontSize: 18,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Scrollbar(
                  thickness: 4,
                  thumbVisibility: true,
                  radius: const Radius.circular(5),
                  child: ValueListenableBuilder<String>(
                    valueListenable: _titleChangeNotifier,
                    builder: (context, value, _) {
                      return ListView.builder(
                        controller: controller,
                        itemExtent: kToolbarHeight,
                        itemCount: _mappedModels.length,
                        itemBuilder: (context, index) {
                          final item = _mappedModels[index];
                          return SingleSelectIconChip<T>(
                            item,
                            key: ValueKey<int>(item.id),
                            height: kToolbarHeight,
                            isSelected: selectedData?.id == item.id,
                            onTap: (selected) {
                              selectedData = objectMapper(selected);

                              onSelected?.call(selected);
                              _titleChangeNotifier.value =
                                  selectedData?.title ?? "";

                              // setState(() {});
                              Navigator.pop(context);
                            },
                          );
                        },
                      );

                      // return SingleChildScrollView(
                      //   controller: _controller,
                      //   child: Column(
                      //     children: [
                      //       for (var i = 0; i < _mappedModels.length; i++)
                      //         SingleSelectIconChip<T>(
                      //           _mappedModels[i],
                      //           key: ValueKey<int>(_mappedModels[i].id),
                      //           height: kToolbarHeight,
                      //           isSelected:
                      //               selectedData?.id == _mappedModels[i].id,
                      //           onTap: (selected) {
                      //             selectedData = objectMapper(selected);
                      //
                      //             onSelected?.call(selected);
                      //             _titleChangeNotifier.value =
                      //                 selectedData?.title ?? "";
                      //
                      //             // setState(() {});
                      //             Navigator.pop(context);
                      //           },
                      //         )
                      //     ],
                      //   ),
                      // );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
