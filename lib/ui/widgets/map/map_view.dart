import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savera_erp/shared/location_helpers.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_button_fab.dart';

class DxMapView extends StatefulWidget {
  final List<DxMapData> data;
  final String title;
  final bool maxFeature = false;

  const DxMapView({
    required this.data,
    required this.title,
    super.key,
  });

  @override
  State<DxMapView> createState() => _DxMapViewState();
}

class _DxMapViewState extends State<DxMapView> {
  final _mapController = Completer<GoogleMapController>();
  final _dataLoader = Completer<bool>();

  Set<Polyline> polyLines = HashSet<Polyline>();
  Set<Marker> markers = HashSet<Marker>();

  late int delay = 20;
  late int i = 0;
  late int animateIndex = 1;
  late int numDeltas = 1;

  late double deltaLat = 0;
  late double deltaLng = 0;
  late LatLng markerPosition;
  late LatLng pos1;
  late LatLng pos2;
  late Uint8List byteData;
  late bool animating = false;

  final List<LatLng> locations = [];

  Future<Uint8List> _createYellowDotIcon() async {
    // Create a yellow dot icon with a size of 10x10 pixels
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, 10, 10));
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Draw a yellow circle in the middle of the 10x10 canvas
    canvas.drawCircle(Offset(5, 5), 5, paint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(10, 10);
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  void initState() {
    locations.addAll(widget.data.map((e) => e.location).toList());

    markerPosition = locations.first;
    pos1 = locations.first;
    pos2 = locations.first;
    _createYellowDotIcon().then((value) {
      byteData = value;
      addMarkers(null);
      _dataLoader.complete(true);

      if (!widget.maxFeature) {
        polyLines.add(Polyline(
          polylineId: PolylineId(pos2.toString()),
          visible: true,
          width: 5,
          points: locations,
          color: Colors.blue, //color of polyline
        ));
      }
    });

    super.initState();
  }

  void addMarkers(LatLng? movingMarkerPosition) {
    markers.clear();
    markers.addAll(widget.data.map((e) {
      return Marker(
        markerId: MarkerId(e.hashCode.toString()),
        position: e.location,
        icon: BitmapDescriptor.bytes(byteData),
        consumeTapEvents: e.title.isNotEmpty,
        infoWindow: InfoWindow(
          title: e.title,
          snippet: e.tooltip,
        ),
      );
    }).toSet());

    if (movingMarkerPosition != null) {
      markers.add(
        Marker(
          markerId: MarkerId("moving-marker"),
          position: movingMarkerPosition,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    // setState(() {});
  }

  void animation() {
    final LatLng latLng = locations[animateIndex];
    i = 0;
    double distance = LocationHelpers.calculateDistance(markerPosition, latLng);
    numDeltas = LocationHelpers.calculateNumberOfDeltas(distance);

    deltaLat = (latLng.latitude - markerPosition.latitude) / numDeltas;
    deltaLng = (latLng.longitude - markerPosition.longitude) / numDeltas;
    movingMarker();
  }

  Future<void> movingMarker() async {
    markerPosition = LatLng(
      markerPosition.latitude + deltaLat,
      markerPosition.longitude + deltaLng,
    );

    addMarkers(markerPosition);
    // markers = {
    //   Marker(
    //     markerId: const MarkerId("moving marker"),
    //     position: markerPosition,
    //     icon: BitmapDescriptor.defaultMarker,
    //   )
    // };

    pos1 = pos2;
    pos2 = markerPosition;

    polyLines.add(Polyline(
      polylineId: PolylineId(pos2.toString()),
      visible: true,
      width: 5,
      points: locations,
      color: Colors.blue, //color of polyline
    ));

    if (mounted) {
      setState(() {});
    }

    if (i != numDeltas) {
      i++;
      await Future.delayed(Duration(milliseconds: delay));
      movingMarker();
    } else {
      if (animateIndex < locations.length - 1) {
        i = 0;
        animateIndex++;
        // delay while animating to next point
        await Future.delayed(Duration(seconds: 2));
        // animateCamera(locations[animateIndex]).whenComplete(animation);
        animation();
      } else {
        animateIndex = 1;
        animating = false;
      }
    }
  }

  Future<void> animateToEachPoint() async {
    animating = true;
    animateIndex = 0;
    i = 0;
    markerPosition = locations[0];
    animation();
  }

  Future<void> animateCamera(LatLng latLng) async {
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<dynamic>(
        future: Future.wait([_dataLoader.future, _mapController.future]),
        builder: (context, snapshot) {
          return Stack(
            children: [
              GoogleMap(
                mapToolbarEnabled: false,
                buildingsEnabled: true,
                trafficEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                compassEnabled: true,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                mapType: MapType.normal,
                minMaxZoomPreference: MinMaxZoomPreference(10, 17),
                initialCameraPosition: CameraPosition(
                  target: locations[0],
                  zoom: 15,
                ),
                // polygons: _polygon,
                polylines: polyLines,
                markers: markers,
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
              ),
              Visibility(
                visible: widget.title.isNotEmpty,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ),
                ),
              ),
              if (_dataLoader.isCompleted == false ||
                  _mapController.isCompleted == false)
                Center(child: CircularProgressIndicator()),
              Visibility(
                visible: widget.maxFeature,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: DxFabExtended.icon(
                      onPressed: animating ? null : animateToEachPoint,
                      radius: 25,
                      text: animating ? 'Animating...' : 'Animate',
                      icon: animating ? null : const Icon(Icons.refresh),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DxMapData {
  final LatLng location;
  final String title;
  final String tooltip;

  DxMapData({
    required this.location,
    required this.title,
    required this.tooltip,
  });
}
