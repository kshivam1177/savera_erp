import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savera_erp/ui/pages/auth/pg_login.dart';
import 'package:savera_erp/ui/pages/home/pg_home.dart';
 import 'package:savera_erp/ui/theme/custom_app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

part '/route/route_mapper.dart';

class SaveraERP extends StatelessWidget {
  const SaveraERP({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ProviderScope(
      child: ToastificationWrapper(
        child: MaterialApp.router(
          title: 'Savera ERP',
          debugShowCheckedModeBanner: false,
          theme: CustomAppTheme.defaultTheme,
          routerConfig: RouteMapper._router,
        ),
      ),
    );
  }
}
