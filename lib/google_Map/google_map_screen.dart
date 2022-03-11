import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMapPolyline extends StatefulWidget {
  @override
  _TestMapPolylineState createState() => _TestMapPolylineState();
}

class _TestMapPolylineState extends State<TestMapPolyline> {
  final Set<Marker> _markers = {};
  List<Map<String, dynamic>> list = [
    {"title": "one", "id": "1", "lat": 21.2172738, "lon": 72.8869815},
    {"title": "two", "id": "2", "lat": 21.2115735, "lon": 90.3700},
    {"title": "three", "id": "3", "lat": 21.218411, "lon": 72.8800206},
    {"title": "three", "id": "4", "lat": 21.2181109, "lon": 72.8731113},
    {"title": "three", "id": "5", "lat": 21.2151505, "lon": 72.8701072},
  ];

  GoogleMapController controller;

  static LatLng _lat1 = LatLng(21.2172738, 72.8869815);
  static LatLng _lat2 = LatLng(21.2115735, 72.8673127);
  static LatLng _lat3 = LatLng(21.218411, 72.8800206);
  static LatLng _lat4 = LatLng(21.2181109, 72.8731113);
  static LatLng _lat5 = LatLng(21.2151505, 72.8701072);

  double CAMERA_ZOOM = 13;
  double CAMERA_TILT = 0;
  double CAMERA_BEARING = 30;
  LatLng SOURCE_LOCATION = LatLng(21.2172738, 72.8869815);
  LatLng DEST_LOCATION = LatLng(21.2151505, 72.8701072);
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = {};
  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/start.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/marker.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        /* polylines: {
          Polyline(
              polylineId: PolylineId('1'),
              width: 5,
              color: Colors.red,
              geodesic: true,
              points: [_lat1, _lat2, _lat3, _lat4, _lat5])
        },*/
        polylines: _polylines,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            zoom: CAMERA_ZOOM,
            bearing: CAMERA_BEARING,
            tilt: CAMERA_TILT,
            target: SOURCE_LOCATION),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    controller = controllerParam;
    setMapPins();
    setPolylines();
    /* list.forEach((element) {
        _markers.add(Marker(
          markerId: MarkerId(element['id']),
          position: LatLng(element['lat'], element['lon']),
          infoWindow: InfoWindow(
            title: element['title'],
            snippet: 'This is a snippet',
          ),
        ));
      });*/
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId("sourcePin"), position: _lat1, icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId("destPin"),
          position: _lat2,
          icon: destinationIcon));

      _markers.add(Marker(
          markerId: MarkerId("3"), position: _lat3, icon: destinationIcon));
      _markers.add(Marker(
          markerId: MarkerId("4"), position: _lat4, icon: destinationIcon));
      _markers.add(Marker(
          markerId: MarkerId("5"), position: _lat5, icon: destinationIcon));
    });
  }

  setPolylines() async {
    PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
            'AIzaSyDHoIoDNaSb9qfCOpu-kC7RoSaVjnZoUFM',
            PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),
            PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude),
            travelMode: TravelMode.driving)
        .then((value) {
      print('dd=>${value.points} ${value.status}');
      if (value.points.isNotEmpty) {
        value.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      setState(() {
        Polyline polyline = Polyline(
            polylineId: PolylineId('s'),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates);
        _polylines.add(polyline);
      });
    }).catchError((e) => log('ERROR+>$e'));
  }
}

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;

  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red,
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId("10"),
      center: LatLng(21.2172738, 72.8869815),
      radius: 500,
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(21.2172738, 72.8869815), zoom: 15.0),
        circles: circles,
        mapType: MapType.normal,
        polylines: Set<Polyline>.of(_mapPolylines.values),
      ),
    );
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(LatLng(21.2172738, 72.8869815));
    points.add(LatLng(21.218411, 72.8800206));
    points.add(LatLng(21.218411, 72.8800206));
    points.add(LatLng(21.2181109, 72.8731113));
    points.add(LatLng(21.2151505, 72.8701072));
    return points;
  }
}*/
