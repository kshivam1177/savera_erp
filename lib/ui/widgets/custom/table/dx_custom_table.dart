import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DxCustomTable<T> extends StatefulWidget {
  DxCustomTable({
    super.key,
    required this.columnDefinition,
    required this.data,
    required this.buildCell,
    this.scrollableAfter = -1,
  });

  final List<DxDataTableCell<String>> columnDefinition;
  final List<List<T>> data;
  final Widget Function(T, int, int) buildCell;
  final int scrollableAfter;

  @override
  State<DxCustomTable<T>> createState() => _DxCustomTableState<T>();
}

class _DxCustomTableState<T> extends State<DxCustomTable<T>> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DxDataTableRow<String>(
            columns: widget.columnDefinition,
            isHeader: true,
            controller: controller,
            cellPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            buildCell: (data, index) {
              return DxText(
                data,
                bold: true,
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, rowIndex) {
                final rowItems = widget.data[rowIndex];
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
  final Widget Function(T, int) buildCell;
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
    return Expanded(
      flex: cellData.flex,
      child: Container(
        child: buildCell(cellData.value, index),
        padding: cellPadding,
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
