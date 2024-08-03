part of '/../main_app.dart';

abstract class RouteMapper {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: "/",
        // builder: (BuildContext context, GoRouterState state) {
        //   return PgLogin();
        // },
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgLogin(),
          );
        },
      ),
      GoRoute(
        path: PgLogin.routeName,
        name: PgLogin.routeName,
        // builder: (BuildContext context, GoRouterState state) {
        //   return const PgLogin();
        // },
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgLogin(),
          );
        },
      ),
      GoRoute(
        path: PgHome.routeName,
        name: PgHome.routeName,
        // builder: (BuildContext context, GoRouterState state) {
        //   final qpms = state.uri.queryParameters;
        //   return PgHome(arg1: qpms["arg1"] ?? "");
        // },
        pageBuilder: (context, state) {
          final qpms = state.uri.queryParameters;
          return _pageTransition(
            key: state.pageKey,
            child: PgHome(arg1: qpms["arg1"] ?? ""),
          );
        },
      ),
      GoRoute(
        path: PgAttendance.routeName,
        name: PgAttendance.routeName,
        pageBuilder: (context, state) {
          // final qpms = state.uri.queryParameters;
          return _pageTransition(
            key: state.pageKey,
            child: PgAttendance(),
          );
        },
      ),
      GoRoute(
        path: PgMapView.routeName,
        name: PgMapView.routeName,
        pageBuilder: (context, state) {
          final qpms = state.uri.queryParameters;
          return _pageTransition(
            key: state.pageKey,
            child: PgMapView(
              empId: int.parse("${qpms["empId"]}"),
              fromDate: DateTime.parse("${qpms["fromDate"]}"),
              toDate: DateTime.parse("${qpms["toDate"]}"),
              routePlanId: int.parse("${qpms["routePlanId"]}"),
              empName: "${qpms["empName"]}",
            ),
          );
        },
      ),
      GoRoute(
        path: PgRM.routeName,
        name: PgRM.routeName,
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgRM(),
          );
        },
      )
    ],
  );

  static CustomTransitionPage _pageTransition({
    required LocalKey? key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          // opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
