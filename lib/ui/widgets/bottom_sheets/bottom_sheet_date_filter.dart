import 'package:flutter/material.dart';
import 'package:savera_erp/models/reports/from_date_to_date.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/ui/theme/ui_fonts.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DateRangePicker extends StatefulWidget {
  final DateRangeFilter filter;
  final ValueChanged<DateRangeFilter> apply;

  const DateRangePicker({
    super.key,
    required this.filter,
    required this.apply,
  });

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInCirc,
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            ListTile(
              title: Text(
                "Apply Date Filter",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.semiBold,
                  fontSize: 14,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 10,
                top: 0,
                bottom: 10,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text(
                            "From Date  ",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            "${DxDateUtils.getFormattedDate(
                              widget.filter.from,
                              isYMD: false,
                              isSlashed: false,
                            )} ",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? selDate = await _selectDate(
                                context,
                                widget.filter.from,
                              );
                              setState(() {
                                if (selDate != null) {
                                  widget.filter.from = selDate;
                                }
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              height: 30.0,
                              decoration: BoxDecoration(
                                //   color: isSelected ?Colors.blueAccent: Colors.transparent,
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text(
                            "To Date  ",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            "${DxDateUtils.getFormattedDate(
                              widget.filter.to,
                              isYMD: false,
                              isSlashed: false,
                            )} ",
                            style: AppStyles.getTextStyle(true, 12),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? selDate = await _selectDate(
                                context,
                                widget.filter.to,
                              );
                              setState(() {
                                if (selDate != null) {
                                  widget.filter.to = selDate;
                                }
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              height: 30.0,
                              decoration: BoxDecoration(
                                //   color: isSelected ?Colors.blueAccent: Colors.transparent,
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ButtonTheme(
                    height: 45.0,
                    minWidth: MediaQuery.of(context).size.width,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        widget.apply(widget.filter);
                        Navigator.pop(context);
                      },
                      color: Theme.of(context).primaryColor,
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime initialDate,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2018, 08, 15),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    return picked;
  }
}
