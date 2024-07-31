import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DatePicker extends StatefulWidget {
  final ValueSetter<DateTime> onSelected;

  const DatePicker({
    required this.onSelected,
    super.key,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.black.shade200,
              width: 1,
            ),
          ),
          child: Row(
            children: <Widget>[
              DxTextBlack(
                selectedDate == null
                    ? 'Select Date'
                    : DxDateUtils.getDateString(selectedDate!),
              ),
              SizedBox(width: 5),
              Icon(
                CupertinoIcons.calendar_today,
                color: AppColors.black.shade500,
              ),
            ],
          ),
        ),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000, 01, 01),
            lastDate: DateTime.now().add(Duration(days: 365 * 2)),
          ).then((value) {
            if (value != null && value != selectedDate) {
              setState(() {
                selectedDate = value;
              });
              widget.onSelected(value);
            }
          });
        },
      ),
    );
  }
}
