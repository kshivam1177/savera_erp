import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savera_erp/ui/widgets/map/map_view.dart';

class PgMapView extends StatefulWidget {
  static const String routeName = '/map-view';

  final int empId;
  final String empName;
  final bool maxFeature = false;

  const PgMapView({
    required this.empId,
    required this.empName,
    super.key,
  });

  @override
  State<PgMapView> createState() => _PgMapViewState();
}

class _PgMapViewState extends State<PgMapView> {
  // created list of locations to display polygon
  List<LatLng> locations = [
    LatLng(28.625216, 77.0629714),
    LatLng(28.6219151, 77.0532867),
    LatLng(28.6213112, 77.0434357),
    LatLng(28.6209607, 77.0347917),
    LatLng(28.6225367, 77.0357474),
    LatLng(28.6241025, 77.0354245),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DxMapView(
        data: locations.map((e) {
          return DxMapData(
            location: e,
            title: 'title ${e.toString()}',
            tooltip: 'tooltip ${e.toString()}',
          );
        }).toList(),
      ),
    );
  }
}
