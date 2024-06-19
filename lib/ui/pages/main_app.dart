import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savera_erp/local_storage/preference_handler.dart';
import 'package:savera_erp/ui/route/path_mapper.dart';
import 'package:savera_erp/ui/theme/custom_app_theme.dart';
import '../route/app_router.dart';

class SaveraERP extends StatelessWidget {
  const SaveraERP({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ProviderScope(
      child: MaterialApp(
        title: 'Savera ERP',
        debugShowCheckedModeBanner: false,
        navigatorObservers: const [
          // NewRelicNavigationObserver(),
        ],
        theme: CustomAppTheme.defaultTheme,
        home: _AppSplashScreen(),
        // onGenerateRoute: PathMapper.generateRoute,
        routes: PathMapper.routes,
      ),
    );
  }
}

class _AppSplashScreen extends StatefulWidget {
  @override
  State<_AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<_AppSplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PrefHandler.isLoggedIn().then(navigateInside);
    });
    super.initState();
  }

  void navigateInside(bool navigateInside) {
    if (navigateInside) {
      AppRouter.toHomePage(context);
    } else {
      AppRouter.toLoginPage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 40.0,
          width: 40.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
