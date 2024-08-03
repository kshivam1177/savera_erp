import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/rm/rm_bloc.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/pages/rm/rm_detail.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';
import 'package:savera_erp/ui/widgets/app_bar/search_app_bar.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_icon_button.dart';
import 'package:savera_erp/ui/widgets/custom/dx_center_text.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgRM extends StatefulWidget {
  static const String routeName = '/relationship-managers';

  const PgRM({
    super.key,
  });

  @override
  State<PgRM> createState() => _PgRMState();
}

class _PgRMState extends State<PgRM> {
  final RMBloc rmCubit = RMBloc();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>('');
  final List<DxDataTableCell<String>> columns = [];

  @override
  void initState() {
    rmCubit.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: "Relationship Managers",
        hintText: "Search by name...",
        showBackButton: false,
        onBtnClick: (bool value) {},
        onQueryChanged: (String value) {
          searchQuery.value = value;
        },
      ),
      body: ValueListenableBuilder<RMState>(
        valueListenable: rmCubit.rmListNotifier,
        builder: (context, value, child) {
          if (value is RMInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (value is RMError) {
            return DxCenterText(text: value.error);
          }
          final state = value as RMLoaded;
          if (state.data.isEmpty) {
            return DxCenterText(
              text: "RelationShipManager not found ",
            );
          }
          columns.clear();
          columns.addAll([
            DxDataTableCell(flex: 1, value: "Id"),
            DxDataTableCell(flex: 4, value: "Name"),
            DxDataTableCell(flex: 2, value: "Phone"),
            DxDataTableCell(flex: 2, value: "Join Date"),
            DxDataTableCell(flex: 2, value: "User Name"),
            DxDataTableCell(flex: 2, value: "Last Login"),
            DxDataTableCell(flex: 2, value: "Created On"),
            DxDataTableCell(flex: 2, value: "Action")
          ]);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: DxCustomTable<String>(
              scrollableAfter: 0,
              searchQuery: searchQuery,
              columnDefinition: columns,
              searchFilter: (data, index) {
                return data[1].toLowerCase().contains(searchQuery.value);
              },
              data: state.data.map((e) {
                return [
                  "${e.staffId}",
                  e.staffName,
                  e.staffPhone,
                  e.joinDate,
                  e.loginUserName,
                  e.lastLoginDate,
                  e.loginCreatedOn,
                  ""
                ];
              }).toList(),
              buildCell: (value, rowIndex, columnIndex) {
                if (columns[columnIndex].value == "Action")
                  return DxCellView(
                    child: _RelationShipManagerActionItems(
                      item: state.data[rowIndex],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4),
                  );
                return DxCellView(
                  child: DxText(value, fontSize: 14),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _RelationShipManagerActionItems extends StatelessWidget {
  final RmListLoginItem item;

  const _RelationShipManagerActionItems({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DxIconButton(
          tooltip: "Rm Info",
          icon: SizedBox(
            width: 45,
            child: Icon(
              CupertinoIcons.info,
              size: 20,
            ),
          ),
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: DxText(
                    "Details of ${item.staffName}",
                    bold: true,
                    fontSize: 18,
                  ),
                  content: RmDetail(item: item),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
        ),
        if (item.loginUserName.isNotEmpty)
          DxIconButton(
            tooltip: "Restrict Mobile Use",
            icon: Icon(
              CupertinoIcons.lock,
              color: AppColors.red,
              size: 20,
            ),
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: DxText(
                      "Are you sure to restrict mobile access for '${item.staffName}' ?",
                      bold: true,
                      fontSize: 18,
                    ),
                    icon: Icon(
                      CupertinoIcons.lock,
                      color: AppColors.red,
                      size: 40,
                    ),
                    content: RmRestrict(item: item),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: DxTextRed("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Helpers.toast(
                            context,
                            msg:
                                "Login Restricted Successfully # ${item.loginUserName}",
                          );
                          Navigator.of(context).pop();
                        },
                        child: DxTextGreen("Restrict Now"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        if (item.loginUserName.isEmpty)
          DxIconButton(
            tooltip: "Create Mobile Login",
            icon: Icon(
              CupertinoIcons.lock_open,
              color: AppColors.green,
              size: 20,
            ),
            onTap: () {
              final userNameController = TextEditingController();
              final passController = TextEditingController();
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: DxText(
                      "Create Login for '${item.staffName}'",
                      bold: true,
                      fontSize: 18,
                    ),
                    icon: Icon(
                      CupertinoIcons.lock_open,
                      color: AppColors.green,
                      size: 40,
                    ),
                    content: RmCreateLogin(
                      item: item,
                      userNameController: userNameController,
                      passController: passController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: DxTextRed("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (userNameController.text.isEmpty) {
                            Helpers.toast(
                              context,
                              msg: "User name is empty",
                            );
                            return;
                          }
                          if (passController.text.isEmpty) {
                            Helpers.toast(
                              context,
                              msg: "Password is empty",
                            );
                            return;
                          }

                          Helpers.toast(
                            context,
                            msg:
                                "Login Created Successfully \n{ ${userNameController.text}  <> ${passController.text} }",
                          );
                          Navigator.of(context).pop();
                        },
                        child: DxTextGreen("Create Now"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
      ],
    );
  }
}
