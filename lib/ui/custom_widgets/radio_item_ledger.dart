import 'package:flutter/material.dart';

class RadioItemLedger extends StatelessWidget {
  final RadioModel? itemModel;

  final double eachItemWidth;

  const RadioItemLedger({super.key, this.itemModel, this.eachItemWidth = 130});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: itemModel!.text.isNotEmpty
          ? Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                getRadioBtnItem(
                  itemModel!.buttonText,
                  itemModel!.isSelected,
                  context,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(itemModel!.text),
                )
              ],
            )
          : getRadioBtnItem(
              itemModel!.buttonText,
              itemModel!.isSelected,
              context,
            ),
    );
  }

  Widget getRadioBtnItem(
    String btnTxt,
    bool isSelected,
    BuildContext context,
  ) =>
      Container(
        //padding: EdgeInsets.only(left: 14, right: 14),
        height: 25.0,
        width: eachItemWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
//            color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            btnTxt,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).colorScheme.secondary,
              //fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      );
}

class RadioModel {
  final bool isSelected;

  final String buttonText;
  final String text;

  RadioModel({
    this.isSelected = false,
    required this.buttonText,
    required this.text,
  });
}
