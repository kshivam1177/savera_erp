import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final RadioModel? radioModel;
  final double roundedBorderRadius;

  const RadioItem({super.key,
    this.radioModel,
    this.roundedBorderRadius = 35,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      //margin: new EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
      child: radioModel!.text.isNotEmpty
          ? Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                getRadioBtnItem(
                  radioModel!.buttonText,
                  radioModel!.isSelected,
                  context,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(radioModel!.text),
                )
              ],
            )
          : getRadioBtnItem(
              radioModel!.buttonText,
              radioModel!.isSelected,
              context,
            ),
    );
  }

  Widget getRadioBtnItem(
    String btnTxt,
    bool isSelected,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14),
      height: 10.0,
      decoration: BoxDecoration(
        //   color: isSelected ?Colors.blueAccent: Colors.transparent,
        color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
        border: Border.all(
          width: 1.0,
          color: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(roundedBorderRadius),
        ),
      ),
      child: Center(
        child: Text(
          btnTxt,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            //fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}

class RadioModel<T> {
  bool isSelected = false;
  final String buttonText;
  final String text;
  final T? value;

  RadioModel({
    required this.buttonText,
    required this.text,
    this.isSelected = false,
    this.value,
  });
}
