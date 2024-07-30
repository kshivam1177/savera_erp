import 'package:flutter/material.dart';
import 'package:savera_erp/models/attendance/rm_list_attendance_item.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class AttendanceDetail extends StatelessWidget {
  final RmListAttendanceItem item;

  const AttendanceDetail({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.network(item.selfieUrl, height: 350)),
        SizedBox(height: 10),
        DxTextBlack('Designation : ${item.staffDesignation}'),
        DxTextBlack('Punch In : ${item.punchInDate}'),
        DxTextBlack('Punch In Device Time: ${item.punchInDeviceTime}'),
        DxTextBlack('Punch Out : ${item.punchOutDate}'),
        DxTextBlack('Punch Out Device Time : ${item.punchOutDeviceTime}'),
        DxTextBlack('Remarks : ${item.remarks}'),
      ],
    );
  }
}
