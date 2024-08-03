import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DxCustomTable<T> extends StatefulWidget {
  DxCustomTable({
    super.key,
    required this.columnDefinition,
    required this.data,
    required this.buildCell,
    this.scrollableAfter = -1,
    this.searchQuery,
    this.searchFilter,
  });

  final List<DxDataTableCell<String>> columnDefinition;
  final List<List<T>> data;
  final DxCellView Function(T, int, int) buildCell;
  final int scrollableAfter;
  final ValueNotifier<String>? searchQuery;
  final bool Function(List<T>, int)? searchFilter;

  @override
  State<DxCustomTable<T>> createState() => _DxCustomTableState<T>();
}

class _DxCustomTableState<T> extends State<DxCustomTable<T>> {
  final ScrollController controller = ScrollController();
  List<List<T>> filteredData = [];

  @override
  void initState() {
    filteredData = widget.data;
    if (widget.searchFilter != null) {
      widget.searchQuery?.addListener(() {
        List<List<T>> copyItems = List.from(widget.data);
        filteredData = [];
        if (widget.searchQuery!.value.isNotEmpty) {
          for (int i = 0; i < copyItems.length; i++) {
            if (widget.searchFilter!(copyItems[i], i)) {
              filteredData.add(copyItems[i]);
            }
          }
        } else {
          filteredData = copyItems;
        }
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DxDataTableRow<String>(
            key: ValueKey(filteredData.hashCode),
            columns: widget.columnDefinition,
            isHeader: true,
            controller: controller,
            cellPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            buildCell: (data, index) {
              return DxCellView(
                child: DxText(
                  data,
                  bold: true,
                  fontSize: 14,
                ),
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, rowIndex) {
                final rowItems = filteredData[rowIndex];
                return DxDataTableRow<T>(
                  controller: controller,
                  cellPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  columns: [
                    for (int i = 0; i < rowItems.length; i++)
                      DxDataTableCell<T>(
                        flex: widget.columnDefinition[i].flex,
                        value: rowItems[i],
                      )
                  ],
                  buildCell: (data, columnIndex) {
                    return widget.buildCell(data, rowIndex, columnIndex);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DxDataTableRow<T> extends StatelessWidget {
  final List<DxDataTableCell<T>> columns;
  final DxCellView Function(T, int) buildCell;
  final EdgeInsets cellPadding;
  final bool isHeader;
  final ScrollController controller;

  const DxDataTableRow({
    super.key,
    required this.columns,
    required this.buildCell,
    required this.controller,
    this.cellPadding = const EdgeInsets.all(4),
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < columns.length; i++) getCellView(columns[i], i)
      ],
    );
  }

  Widget getCellView(DxDataTableCell<T> cellData, int index) {
    final cellView = buildCell(cellData.value, index);
    return Expanded(
      flex: cellData.flex,
      child: Container(
        child: cellView.child,
        padding: isHeader ? cellPadding : cellView.padding ?? cellPadding,
        decoration: BoxDecoration(
          color: isHeader ? Colors.blue.shade50 : Colors.transparent,
          border: Border.all(
            color: Colors.black12,
            width: 0.1,
          ),
        ),
      ),
    );
  }
}

class DxDataTableCell<T> {
  final int flex;
  final T value;

  const DxDataTableCell({
    required this.flex,
    required this.value,
  });
}

class DxCellView {
  final Widget child;
  final EdgeInsets? padding;

  const DxCellView({
    required this.child,
    this.padding,
  });
}
