import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/rm/rm_bloc.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/ui/pages/rm/rm_detail.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/app_bar/search_app_bar.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_icon_button.dart';
import 'package:savera_erp/ui/widgets/custom/dx_center_text.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/dailog/common_dialog.dart';

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
        // showBackButton: false,
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
                      bloc: rmCubit,
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

class _RelationShipManagerActionItems extends StatefulWidget {
  final RmListLoginItem item;
  final RMBloc bloc;

  const _RelationShipManagerActionItems({
    required this.item,
    required this.bloc,
  });

  @override
  State<_RelationShipManagerActionItems> createState() =>
      _RelationShipManagerActionItemsState();
}

class _RelationShipManagerActionItemsState
    extends State<_RelationShipManagerActionItems> {
  @override
  void initState() {
    widget.bloc.rmCreateNotifier.addListener(() {
      final state = widget.bloc.rmCreateNotifier.value;
      if (state is RMCreated && state.rowId == widget.item.staffId) {
        commonDialog(
          context,
          state.msg,
          isSuccess: state.isCreated,
          positiveCallback: () {
            Navigator.of(context).pop();

            if (state.isCreated) {
              widget.bloc.getAll();
            }
          },
        );
        return;
      }
      if (state is RMMarkedInactive && state.rowId == widget.item.staffId) {
        commonDialog(
          context,
          state.msg,
          isSuccess: state.isInactive,
          positiveCallback: () {
            Navigator.of(context).pop();
            if (state.isInactive) {
              widget.bloc.getAll();
            }
          },
        );
      }
      return;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RMCreateState>(
      valueListenable: widget.bloc.rmCreateNotifier,
      builder: (context, value, _) {
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
                        "Details of ${widget.item.staffName}",
                        bold: true,
                        fontSize: 18,
                      ),
                      content: RmDetail(item: widget.item),
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
            Visibility(
              visible:
                  value is RMCreating && value.rowId == widget.item.staffId,
              child: Stack(
                children: [
                  getActionIcon(),
                  Container(
                    height: 20,
                    width: 20,
                    color: AppColors.white.withOpacity(0.6),
                    padding: EdgeInsets.all(2),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ],
              ),
              replacement: getActionIcon(),
            )
          ],
        );
      },
    );
  }

  Widget getActionIcon() {
    if (widget.item.loginUserName.isNotEmpty)
      return DxIconButton(
        tooltip: widget.item.loginInactiveOn.isNotEmpty
            ? "Mark Mobile User 'Active'"
            : "Mark Mobile User 'InActive'",
        icon: widget.item.loginInactiveOn.isNotEmpty
            ? Icon(
                CupertinoIcons.lock_open,
                color: AppColors.green,
                size: 20,
              )
            : Icon(
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
                  "Are you sure to restrict mobile access for '${widget.item.staffName}' ?",
                  bold: true,
                  fontSize: 16,
                ),
                icon: Icon(
                  CupertinoIcons.lock,
                  color: AppColors.red,
                  size: 40,
                ),
                content: RmRestrict(item: widget.item),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: DxTextRed("Cancel"),
                  ),
                  ValueListenableBuilder<RMCreateState>(
                    valueListenable: widget.bloc.rmCreateNotifier,
                    builder: (context, value, _) {
                      return TextButton(
                        onPressed: value is RMCreating
                            ? null
                            : () {
                                widget.bloc.markMobileUserInactive(
                                  context,
                                  widget.item,
                                );
                              },
                        child: value is RMCreating
                            ? Container(
                                height: 20,
                                width: 20,
                                color: AppColors.white.withOpacity(0.6),
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : DxTextGreen(
                                widget.item.loginInactiveOn.isNotEmpty
                                    ? "Set Active"
                                    : "Set InActive",
                              ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    if (widget.item.loginUserName.isEmpty)
      return DxIconButton(
        tooltip: "Create Mobile Login",
        icon: Icon(
          Icons.vpn_key_outlined,
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
                  "Create Login for '${widget.item.staffName}'",
                  bold: true,
                  fontSize: 16,
                ),
                icon: Icon(
                  CupertinoIcons.lock_open,
                  color: AppColors.green,
                  size: 40,
                ),
                content: RmCreateLogin(
                  item: widget.item,
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
                  ValueListenableBuilder<RMCreateState>(
                    valueListenable: widget.bloc.rmCreateNotifier,
                    builder: (context, value, _) {
                      return TextButton(
                        onPressed: value is RMCreating
                            ? null
                            : () {
                                widget.bloc.createMobileUser(
                                  context,
                                  rm: widget.item,
                                  username: userNameController.text.trim(),
                                  password: passController.text.trim(),
                                );
                              },
                        child: value is RMCreating
                            ? Container(
                                height: 20,
                                width: 20,
                                color: AppColors.white.withOpacity(0.6),
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : DxTextGreen("Create Now"),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    return SizedBox();
  }
}
