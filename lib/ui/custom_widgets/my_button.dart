import 'package:flutter/material.dart';

class MyButton {
  static greenOutlineButtonTheme(
    BuildContext context,
    String buttonText,
    double height,
    Function callBackFunction,
  ) =>
      ButtonTheme(
          height: 34.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0), side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
          child: MaterialButton(
            onPressed: () {
              callBackFunction(context);
            },
            color: Colors.white,
            child: Text(buttonText,
                style: const TextStyle(
                  color: Colors.green,
                ),),
          ),);
}