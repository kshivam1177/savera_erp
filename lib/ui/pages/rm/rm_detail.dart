import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/custom/input/dx_input_fields.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text_with_heading.dart';

class RmDetail extends StatelessWidget {
  final RmListLoginItem item;

  const RmDetail({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    color: AppColors.black.shade50,
                  ),
                ),
                // DxTextBlack(
                //   'Personal Details',
                //   fontSize: 12.0,
                //   bold: true,
                // ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Name",
                          text: item.staffName,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Phone",
                          text: item.staffPhone,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Location",
                          text: item.staffLocation,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Join Date",
                          text: item.joinDate,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "User Name",
                          text: item.loginUserName,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Last Login",
                          text: item.lastLoginDate,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Created On",
                          text: item.loginCreatedOn,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DxTextWithHeading(
                          label: "Login Device",
                          text: item.loginDeviceInfo,
                          labelSize: 12,
                          textSize: 12,
                        ),
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}

class RmRestrict extends StatelessWidget {
  final RmListLoginItem item;

  const RmRestrict({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DxTextBlack(
                'Personal Details',
                fontSize: 12.0,
                bold: true,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Name",
                        text: item.staffName,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Phone",
                        text: item.staffPhone,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Location",
                        text: item.staffLocation,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Join Date",
                        text: item.joinDate,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(0),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey, width: 0.2),
          //   borderRadius: BorderRadius.circular(5),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DxTextBlack(
                'Login Details',
                fontSize: 12.0,
                bold: true,
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: 35,
                child: DxInputText(
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    size: 20,
                    color: AppColors.navyBlue.shade500,
                  ),
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  textSize: 14.0,
                  borderWidth: 0.5,
                  controller: TextEditingController(),
                  valueText: item.loginUserName,
                  readOnly: true,
                  enabled: false,
                  hintText: 'User Name',
                  inputFormatters: [],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RmCreateLogin extends StatelessWidget {
  final RmListLoginItem item;
  final TextEditingController userNameController;
  final TextEditingController passController;

  const RmCreateLogin({
    required this.item,
    required this.userNameController,
    required this.passController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DxTextBlack(
                'Personal Details',
                fontSize: 12.0,
                bold: true,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Name",
                        text: item.staffName,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Phone",
                        text: item.staffPhone,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Location",
                        text: item.staffLocation,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: DxTextWithHeading(
                        label: "Join Date",
                        text: item.joinDate,
                      ),
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(0),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey, width: 0.2),
          //   borderRadius: BorderRadius.circular(5),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DxTextBlack(
                'Login Details',
                fontSize: 12.0,
                bold: true,
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: 35,
                child: DxInputText(
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    size: 20,
                    color: AppColors.navyBlue.shade500,
                  ),
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  textSize: 14.0,
                  borderWidth: 0.5,
                  controller: userNameController,
                  valueText: item.staffPhone,
                  hintText: 'User Name',
                  inputFormatters: [],
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                color: Colors.white,
                height: 35,
                child: DxInputText(
                  prefixIcon: Icon(
                    CupertinoIcons.lock,
                    size: 20,
                    color: AppColors.navyBlue.shade500,
                  ),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  textSize: 14.0,
                  borderWidth: 0.5,
                  controller: passController,
                  valueText: item.staffPhone.replaceAll("+", ""),
                  hintText: 'Login Password',
                  inputFormatters: [],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
