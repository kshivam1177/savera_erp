import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class AppLoaderProgress extends StatelessWidget {
  final bool transparentBg;
  final String? title;

  const AppLoaderProgress({
    super.key,
    this.transparentBg = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isAndroid = defaultTargetPlatform != TargetPlatform.android;
    bool displayLoaderAsPerDeviceType = false;
    return transparentBg && title == null
        ? _mainLoader(
            displayLoaderAsPerDeviceType,
            isAndroid,
            isTransparent: true,
          )
        : Scaffold(
            appBar: title != null
                ? AppBar(
                    centerTitle: false,
                    title: DxTextWhite(
                      title!,
                      weight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                : null,
            body: _mainLoader(
              displayLoaderAsPerDeviceType,
              isAndroid,
            ),
          );

//   BOX LOADER
//
//    Container _loaderView = new Container(
//      color: Colors.black26,
//      child: new Center(
//        child: new Container(
//          height: 75.0,
//          width: 75.0,
//          decoration: BoxDecoration(
//            shape: BoxShape.rectangle,
//            color: Colors.white,
//            borderRadius: new BorderRadius.circular(4.0),
//          ),
//          padding: EdgeInsets.all(15.0),
//          child: new CircularProgressIndicator(),
//        ),
//      ),
//    );
  }

  Widget _mainLoader(
    bool displayLoaderAsPerDeviceType,
    bool isAndroid, {
    bool isTransparent = false,
  }) {
    return Container(
      // color: isTransparent ? Colors.black12.withOpacity(0.2) : Colors.black12,
      color: isTransparent ? Colors.black12.withOpacity(0.2) : Colors.white60,
      child: Center(
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: displayLoaderAsPerDeviceType
              ? isAndroid
                  ? const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const CupertinoActivityIndicator(radius: 20)
              : const CircularProgressIndicator(strokeWidth: 2.5),
        ),
      ),
    );
  }
}
