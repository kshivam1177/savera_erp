import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savera_erp/blocs/attendance/attendance_bloc.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/map/map_view.dart';

class PgMapView extends StatefulWidget {
  static const String routeName = '/map-view';

  final int empId;
  final int routePlanId;
  final DateTime fromDate;
  final DateTime toDate;
  final String empName;
  final bool maxFeature = false;

  const PgMapView({
    required this.empId,
    required this.routePlanId,
    required this.fromDate,
    required this.toDate,
    required this.empName,
    super.key,
  });

  @override
  State<PgMapView> createState() => _PgMapViewState();
}

class _PgMapViewState extends State<PgMapView> {
  final AttendanceBloc bloc = AttendanceBloc();

  // created list of locations to display polygon
  // List<LatLng> locations = [
  //   LatLng(28.625216, 77.0629714),
  //   LatLng(28.6219151, 77.0532867),
  //   LatLng(28.6213112, 77.0434357),
  //   LatLng(28.6209607, 77.0347917),
  //   LatLng(28.6225367, 77.0357474),
  //   LatLng(28.6241025, 77.0354245),
  // ];

  @override
  void initState() {
    bloc.getLocations(
      empId: widget.empId,
      routePlanId: widget.routePlanId,
      fromDate: widget.fromDate,
      toDate: widget.toDate,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: ValueListenableBuilder<AttendanceState>(
        valueListenable: bloc.locationNotifier,
        builder: (context, value, _) {
          if (value is AttendanceInitial) {
            return Center(child: CircularProgressIndicator());
          }
          final locations = (value as RmLocationsLoaded).locations;
          if (locations.isEmpty) {
            return Center(child: DxText("No location found"));
          }
          return DxMapView(
            title: widget.empName,
            data: locations.map((e) {
              return DxMapData(
                location: LatLng(e.latitude, e.longitude),
                title: e.createdOn.replaceAll("T", " ").split(".").first +
                    " " +
                    e.platform,
                tooltip: e.address,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
