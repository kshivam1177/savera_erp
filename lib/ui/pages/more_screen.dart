import 'package:flutter/material.dart';
import 'package:savera_erp/models/auth_result.dart';
import 'package:savera_erp/services/storage/preference/preference_handler.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/dailog/logout_dailog.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  AuthResult? userModel;

  @override
  void initState() {
    loadLocalBasicData();
    super.initState();
  }

  Future<void> loadLocalBasicData() async {
    final authResult = await PrefHandler.getAuthResult();
    userModel = authResult;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
//        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Account",
          style: AppStyles.getTextStyleWhite(true, 18),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 8),
            clipBehavior: Clip.antiAlias,
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Hero(
                      tag: "hero",
                      child: CircleAvatar(
                        radius: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DxTextWhite(
                          Helpers.getGreetingText(),
                          weight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        const SizedBox(height: 4),
                        DxTextWhite(
                          userModel?.userName ?? "",
                          weight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        const SizedBox(height: 8),
                        DxTextWhite(
                          userModel?.userType.name ?? "",
                          weight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade700,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          settingButton(
            const Icon(Icons.arrow_forward_ios, size: 15),
            "Edit Profile",
            () {},
          ),
          settingButton(
            const Icon(Icons.arrow_forward_ios, size: 15),
            "About Us",
            () => Helpers.launchUrl(Uri.parse("https://www.palang.in")),
          ),
          settingButton(
            const Icon(Icons.arrow_forward_ios, size: 15),
            "Logout",
            () => showDialog(
              context: context,
              builder: (context) => const LogoutDialog(),
            ),
          ),
        ],
      ),
    );
  }

  Widget myHorizontalDivider() => Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        height: 0.5,
        color: Colors.grey.shade300,
      );

  Widget settingButton(Icon icon, String name, void Function() onTap) {
    return Card(
      color: Colors.grey.withOpacity(0.09),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(children: [
        ListTile(
            trailing: icon,
            title: DxText(
              name,
              fontSize: 18,
            ),
            onTap: onTap),
        const SizedBox.shrink()
      ]),
    );
  }
}
