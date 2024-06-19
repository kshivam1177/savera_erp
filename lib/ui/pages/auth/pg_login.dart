import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:savera_erp/app_utilities/app_images.dart';
import 'package:savera_erp/app_utilities/app_info.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/global_providers.dart';
import 'package:savera_erp/notifiers/auth/login/login_notifier.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/ui/custom_widgets/dx_buttons.dart';
import 'package:savera_erp/ui/custom_widgets/dx_input_fields.dart';
import 'package:savera_erp/ui/custom_widgets/dx_text.dart';

class PgLogin extends StatefulWidget {
  static const String routeName = '/login';

  const PgLogin({
    super.key,
  });

  @override
  State<PgLogin> createState() => _PgLoginState();
}

class _PgLoginState extends State<PgLogin> {
  final loginNotifier = StateNotifierProvider<LoginNotifier, LoginState>(
    (ref) => LoginNotifier(ref.watch(GlobalProviders.userAuth)),
  );

  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      userName.text = "kshivam1177";
      password.text = "123456789";
    }
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            ref.listen<LoginState>(loginNotifier, (previous, currentState) {
              if (currentState is LoginWithResult) {
                if (currentState.user != null) {
                  RouteHelper.toHomePage(context);
                } else if (currentState.errorMsg != null) {
                  Helpers.toast(context, msg: currentState.errorMsg!);
                }
              }
            });

            final loginState = ref.watch(loginNotifier);
            return _LoginBody(
              loginNotifier: ref.read(loginNotifier.notifier),
              userNameController: userName,
              passwordController: password,
              isLoading: loginState is LoginLoading,
            );
          },
        ),
      ),
    );
  }
}

class _LoginBody extends ConsumerWidget {
  const _LoginBody({
    required this.loginNotifier,
    required this.userNameController,
    required this.passwordController,
    this.isLoading = false,
  });

  final LoginNotifier loginNotifier;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // place a check for tab, mobile, desktop
        if (constraints.maxWidth > 1200) {
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
        } else if (constraints.maxWidth > 600) {
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
        }

        return Stack(
          children: [
            loginBody(context),
            if (isLoading) const LinearProgressIndicator(),
          ],
        );
      }),
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

                      // if (userNameController.text.length < 5) {
                      //   Helpers.toast("Invalid UserName");
                      //   return;
                      // } else if (passwordController.text.length < 4) {
                      //   Helpers.toast(
                      //     "Please enter valid and strong Password",
                      //   );
                      // } else {
                      //   loginNotifier.doLogin(
                      //     userNameController.text,
                      //     passwordController.text,
                      //   );
                      // }
                    },
                  ),
                ),
                const SizedBox(height: 15.0),
                DxOutlineButton(
                  "  Forgot Password ?  ",
                  onPressed: () {
                    RouteHelper.toHomePage(context);
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
