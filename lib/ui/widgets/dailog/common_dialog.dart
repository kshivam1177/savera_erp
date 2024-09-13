import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_responsive.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

const double _padding = 8;
const double _avatarRadius = 35;

Future<dynamic> commonDialog(
  BuildContext context,
  String msg, {
  VoidCallback? positiveCallback,
  VoidCallback? negativeCallback,
  bool isSuccess = true,
  String title = "Alert!!",
  String positiveBtnText = "OK",
  String negativeBtnText = "Cancel",
  //for navigation case only.
  bool doNotPop = false,
}) async {
  // RichText richText({String? head, String? val}) => RichText(
  //       text: TextSpan(
  //         text: head,
  //         style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
  //         children: <TextSpan>[
  //           TextSpan(
  //             text: val,
  //             style: Theme.of(context).textTheme.caption!.copyWith(
  //                   color: Colors.grey.shade600,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 10,
  //                 ),
  //           )
  //         ],
  //       ),
  //     );
  return showAdaptiveDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      final isTablet = DxResponsive.isTablet(context);
      final isInLandscape = DxResponsive.isLandScape(context);
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              height: 280,
              width: isInLandscape ? 400 : null,
              padding: const EdgeInsets.only(
                left: _padding,
                top: _avatarRadius + (_padding * 2),
                right: _padding,
                bottom: _padding,
              ),
              margin: EdgeInsets.only(
                top: _avatarRadius,
                right: isTablet ? (isInLandscape ? 200 : 100) : 0,
                left: isTablet ? (isInLandscape ? 200 : 100) : 0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 100,
                    child: RawScrollbar(
                      thumbVisibility: true,
                      thumbColor: Colors.grey.shade600,
                      radius: const Radius.circular(8),
                      child: SingleChildScrollView(
                        child: Text(
                          msg,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          maxLines: null,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: negativeCallback != null
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.end,
                    children: [
                      if (negativeCallback != null)
                        Expanded(
                          child: TextButton(
                            child: Container(
                              color: Colors.grey.shade300,
                              child: DxText(
                                negativeBtnText,
                                textColor: Colors.grey.shade900,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, false);
                              negativeCallback();
                            },
                          ),
                        ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.primary,
                            ),
                          ),
                          onPressed: () {
                            //for navigation case only, do not pop
                            if (!doNotPop) {
                              Navigator.pop(context, true);
                            }
                            if (positiveCallback != null) {
                              positiveCallback();
                            }
                          },
                          child: DxTextWhite(
                            positiveBtnText,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 2,),
                ],
              ),
            ),

            Positioned(
              left: _padding,
              right: _padding,
              child: Container(
                // height: _avatarRadius,
                // width: _avatarRadius,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                  //   boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black38, offset: Offset(0, 10), blurRadius: 10),
                  // ]
                ),
                child: CircleAvatar(
                  backgroundColor:
                      isSuccess ? Colors.green : AppColors.red.shade400,
                  radius: 35,
                  child: isSuccess
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 25,
                        ),
                ),
              ),
            ),
            // Positioned(
            //   top: 50,
            //   left: 10,
            //   child: Text("Version : ${AppConfigs().appVersion}", style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),),
            // ),
          ],
        ),
      );
    },
  );
}
