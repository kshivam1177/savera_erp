import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppIcons {
  static const user = Icons.person;
  static const password = Icons.lock;
  static const pin = Icons.lock_open_rounded;
  static const search = Icons.search;
  static const alertNone = Icons.notifications_none;
  static const alert = Icons.notifications;
  static const home = Icons.home_filled;

  static const dashboard = Icons.app_registration;
  static const arrowDown = Icons.keyboard_arrow_down_rounded;
  static const locationMap = Icons.location_on_outlined;

  static const add = Icons.add;
  static const refresh = Icons.refresh;
  static const edit = Icons.edit;
  static const delete = CupertinoIcons.delete;
  static const filter = Icons.tune_sharp;

  static Widget getMyIcon(
    BuildContext context,
    IconData icons, {
    Color color = Colors.green,
    double size = 35,
  }) =>
      Icon(
        icons,
        size: size,
        color: Theme.of(context).colorScheme.secondary,
      );
}