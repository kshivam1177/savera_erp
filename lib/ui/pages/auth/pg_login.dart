import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:savera_erp/blocs/auth/login/login_notifier.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/app_info.dart';
import 'package:savera_erp/shared/asset_provider/app_images.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_buttons.dart';
import 'package:savera_erp/ui/widgets/custom/input/dx_input_fields.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/dx_layout_builder.dart';

class PgLogin extends StatefulWidget {
  static const String routeName = '/login';

  const PgLogin({
    super.key,
  });

  @override
  State<PgLogin> createState() => _PgLoginState();
}

class _PgLoginState extends State<PgLogin> {
  final loginBloc = LoginBloc();
  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    if (kDebugMode) {
      userName.text = "kshivam1177";
      password.text = "123456789";
    }
    loginBloc.stateNotifier.addListener(() {
      final currentState = loginBloc.stateNotifier.value;
      if (currentState is LoginWithResult) {
        // if (currentState.user != null) {
        //   RouteHelper.toHomePage(context);
        // } else if (currentState.errorMsg != null) {
        //   Helpers.toast(context, msg: currentState.errorMsg!);
        // }
        RouteHelper.toHomePage(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<LoginState>(
        valueListenable: loginBloc.stateNotifier,
        builder: (context, state, _) {
          return _LoginBody(
            bloc: loginBloc,
            userNameController: userName,
            passwordController: password,
            isLoading: state is LoginLoading,
          );
        },
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    required this.bloc,
    required this.userNameController,
    required this.passwordController,
    this.isLoading = false,
  });

  final LoginBloc bloc;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DxLayoutBuilder(
        buildView: (context, deviceType) {
          switch (deviceType) {
            case DxLayoutType.mobile:
              return Stack(
                children: [
                  loginBody(context),
                  if (isLoading) const LinearProgressIndicator(),
                ],
              );
            case DxLayoutType.smallTab:
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: loginBody(context),
                  ),
                  if (isLoading) const LinearProgressIndicator(),
                ],
              );
            case DxLayoutType.tab:
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: loginBody(
                      context,
                      padding: EdgeInsets.only(
                        left: 80.0,
                        right: 80.0,
                        top: 100,
                        bottom: 100,
                      ),
                    ),
                  ),
                ],
              );
            case DxLayoutType.desktop:
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: loginBody(
                      context,
                      padding: EdgeInsets.only(
                        left: 150.0,
                        right: 150.0,
                        top: 100,
                        bottom: 100,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  Widget loginBody(
    BuildContext context, {
    EdgeInsetsGeometry? padding,
  }) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: padding ?? const EdgeInsets.only(left: 25.0, right: 25.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 65.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AppImages.icLogoURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const DxTextBlack(
                  "Welcome to ${AppInfo.appName}",
                  textAlign: TextAlign.center,
                  fontSize: 20,
                ),
                const SizedBox(height: 55.0),
                Container(
                  color: Colors.white,
                  child: DxInputText(
                    prefixIcon: const Icon(Icons.apartment_rounded),
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: userNameController,
                    valueText: userNameController.text,
                    hintText: 'Username',
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  ),
                ),
                const SizedBox(height: 35.0),
                Container(
                  color: Colors.white,
                  child: DxInputText(
                    prefixIcon: const Icon(Icons.lock_outlined),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autofocus: false,
                    controller: passwordController,
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    valueText: passwordController.text,
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 35.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DxFlatButtonAccent(
                    text: "Login",
                    round: 6,
                    weight: FontWeight.w400,
                    fontSize: 18,
                    width: double.maxFinite,
                    height: kToolbarHeight * 0.9,
                    onPressed: () async {
                      if (userNameController.text.length < 5) {
                        Helpers.toast(context, msg: "Invalid UserName");
                        return;
                      } else if (passwordController.text.length < 4) {
                        Helpers.toast(
                          context,
                          msg: "Please enter valid and strong Password",
                        );
                      } else {
                        bloc.doLogin(
                          userNameController.text,
                          passwordController.text,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15.0),
                DxOutlineButton(
                  "  Forgot Password ?  ",
                  onPressed: () {
                    Helpers.toast(context, msg: "Forgot Password Clicked");
                  },
                  size: const Size(double.minPositive, 38),
                  textColor: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 45.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const DxText(
          "Version : ${AppInfo.appVersion}",
          fontSize: 14,
        ),
      ),
    );
  }
}
