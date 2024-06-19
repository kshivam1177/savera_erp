import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_images.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/notifiers/home/home_cubit.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/ui/dailog/logout_dailog.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class PgHome extends StatefulWidget {
  const PgHome({super.key});

  @override
  State<PgHome> createState() => PgHomeState();
}

class PgHomeState extends State<PgHome> {
  AuthResult? userModel;

  @override
  void initState() {
    HomeCubit().loadLocalBasicData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        centerTitle: false,
//        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        title: Image.asset(AppImages.icLogoURL, height: 22),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LogoutDialog();
                },
              );
            },
            icon: const Icon(
              Icons.settings_power,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
      body: _DistributorBodyTiles(AuthResult.guest()),
      // body: body(userModel),
    );
  }

// Widget bodyWithWallet(UserModel userModel) {}
}

class _DistributorBodyTiles extends StatelessWidget {
  final AuthResult userModel;

  const _DistributorBodyTiles(this.userModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 6,
        ),
        Card(
          child: Column(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 12, bottom: 15),
                          alignment: Alignment.center,
                          child: Hero(
                            tag: "hero",
                            child: CircleAvatar(
                              radius: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: ImgProvider.getImg(""),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          Helpers.getGreetingText(),
                          textAlign: TextAlign.center,
                          style: AppStyles.getTextStyle(true, 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userModel.userName,
                          textAlign: TextAlign.center,
                          style: AppStyles.getTextStyle(false, 16),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.brightness_1,
                              size: 12,
                              color: userModel.activeStatus == "ACTIVE"
                                  ? Colors.green
                                  : Colors.redAccent,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              userModel.userType.name,
                              textAlign: TextAlign.center,
                              style: AppStyles.getTextStyle(true, 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Card(
          child: Column(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(
                      context,
                      AppImages.icLogoURL,
                    ),
                    name: "Purchase Order",
                    function: () {},
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Your Cart",
                    function: () {},
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(
                      context,
                      AppImages.icLogoURL,
                    ),
                    name: "Your Orders",
                    function: () {},
                  ),
                ],
              ),
              myHorizontalDivider(),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Wholesale Scan",
                    function: () => Helpers.toast("Wholesale Scan"),
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Retail Scan",
                    function: () => Helpers.toast("Retail Scan"),
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyIcon(context, Icons.keyboard_return),
                    name: "Sale Return",
                    function: () => Helpers.toast("Sale Return"),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 12),
          child: Text("Other Options"),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  _getEachCellWidget(
                      iconWidget: getMyIcon(
                        context,
                        Icons.format_list_numbered,
                      ),
                      name: "Sale Report",
                      function: () => Helpers.toast("Sale Report")),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Ledger Report",
                    function: () {},
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(
                      context,
                      AppImages.icLogoURL,
                    ),
                    name: "Point Ledger",
                    function: () => Helpers.toast("Point Ledger"),
                  ),
                ],
              ),
              myHorizontalDivider(),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Retailers",
                    function: () {},
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Sales Mans",
                    function: () => Helpers.toast("Sales Mans"),
                  ),
                  myVerticalDivider(),
                  _getEachCellWidget(
                    iconWidget: getMyImageAsset(context, AppImages.icLogoURL),
                    name: "Add Retailer",
                    function: () {},
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget myVerticalDivider() => Container(
      width: 0.5,
      height: 70,
      color: Colors.grey.shade300,
    );

Widget myHorizontalDivider() => Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      height: 0.5,
      color: Colors.grey.shade300,
    );

Widget getMyIcon(BuildContext context, IconData icons) => Icon(
      icons,
      size: 35,
      color: Theme.of(context).colorScheme.secondary,
    );

Widget getMyImageAsset(BuildContext context, String url) => Image.asset(
      url,
      height: 35,
      width: 35,
      color: Theme.of(context).colorScheme.secondary,
    );

Widget _getEachCellWidget({
  Widget? iconWidget,
  String? name,
  Function()? function,
}) =>
    Expanded(
      flex: 1,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 12,
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: iconWidget,
              ),
              Text(
                "$name",
                textAlign: TextAlign.center,
                style: AppStyles.getTextStyle(false, 13),
              )
            ],
          ),
        ),
      ),
    );
