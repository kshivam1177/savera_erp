import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/blocs/attendance/attendance_cubit.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgAttendance extends StatefulWidget {
  static const String routeName = '/attendance';

  const PgAttendance({super.key});

  @override
  State<PgAttendance> createState() => _PgAttendanceState();
}

class _PgAttendanceState extends State<PgAttendance> {
  final AttendanceCubit attendanceCubit = AttendanceCubit();

  @override
  void initState() {
    attendanceCubit.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: DxText('Attendance'),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              Helpers.toast(context, msg: "Let me search for you");
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title $index'),
            subtitle: Text('Subtitle $index'),
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            trailing: Icon(CupertinoIcons.right_chevron),
          );
        },
      ),
    );
  }
}
