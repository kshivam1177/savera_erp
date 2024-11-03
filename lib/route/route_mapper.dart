part of '/../main_app.dart';

abstract class RouteMapper {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: PgHome.routeName,
        name: PgHome.routeName,
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgHome(),
          );
        },
      ),
      GoRoute(
        path: '/',
        name: "/",
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgHome(),
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
      ),
      GoRoute(
        path: PgTrackingReport.routeName,
        name: PgTrackingReport.routeName,
        pageBuilder: (context, state) {
          return _pageTransition(
            key: state.pageKey,
            child: PgTrackingReport(),
          );
        },
      ),
      GoRoute(
        path: PgTrackingDetail.routeName,
        name: PgTrackingDetail.routeName,
        pageBuilder: (context, detState) {
          final qpms = detState.uri.queryParameters["qpms"];
          final qpmsDecoded = jsonDecode(
            Helpers.fromBase64(qpms) ?? "{}",
          );
          return _pageTransition(
            key: detState.pageKey,
            child: PgTrackingDetail(
              row: VisitTrackingItem.fromMap(qpmsDecoded["tracking_row"]),
              filter: DateRangeFilter.fromMap(qpmsDecoded["date_filter"]),
            ),
          );
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final bool loggedIn = await PrefHandler.isLoggedIn();
      if (!loggedIn) {
        return PgLogin.routeName;
      }
      final _currentRoute = state.fullPath?.split("?")[0];
      if ([PgHome.routeName, PgLogin.routeName]
          .any((e) => e == _currentRoute)) {
        print("here>> $_currentRoute");
        return PgHome.routeName;
      }
      print("here:>> null ($_currentRoute)");
      return null;
    },
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
