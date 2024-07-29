import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class GridData extends StatelessWidget {
  const GridData({super.key});

  @override
  Widget build(BuildContext context) {
    return DxCustomTable<String>(
      scrollableAfter: 0,
      columnDefinition: [
        DxDataTableCell(flex: 1, value: "SRN"),
        DxDataTableCell(flex: 3, value: "Name"),
        DxDataTableCell(flex: 2, value: "DOB"),
        DxDataTableCell(flex: 2, value: "Status"),
      ],
      data: List.generate(5000, (i) {
        return [
          "${i + 1}",
          "Name Value Here ${i + 1}",
          "01/01/2020",
          "${i % 2 == 0 ? "Active" : "Inactive"}",
        ];
      }),
      buildCell: (value, rowIndex, columnIndex) {
        return DxText(value);
      },
    );
  }
}
