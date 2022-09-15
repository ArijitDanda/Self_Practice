import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMAp extends StatefulWidget {
  const GoogleMAp({super.key});

  @override
  State<GoogleMAp> createState() => _GoogleMApState();
}

class _GoogleMApState extends State<GoogleMAp> {
  static const double _defaultlat = 27.2046;
  static const double _defaultlon = 77.4977;
  late StreamSubscription _locationSubcription;
  // late Marker mark;
  // late Circle circle;
  final Location _locationtracker = Location();
  final Set<Marker> _markers = {};
  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('assets/car.png');
    return byteData.buffer.asUint8List();
  }

  late final GoogleMapController _googlemapcntrl;
  MapType currentmaptype = MapType.normal;
  static const CameraPosition _defaultlocation =
      CameraPosition(target: LatLng(_defaultlat, _defaultlon), zoom: 15);
  @override
  void dispose() {
    if (_locationSubcription != null) {
      _locationSubcription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: Stack(children: [
        GoogleMap(
          onMapCreated: (controller) => _googlemapcntrl = controller,
          // markers: Set.of((mark != null) ? [mark] : []),
          // circles: Set.of((circle != null) ? [circle] : []),
          initialCameraPosition: _defaultlocation,
          mapType: currentmaptype,
        ),
        Container(
          padding: const EdgeInsets.only(top: 25, right: 20),
          alignment: Alignment.topRight,
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: _changemaptype,
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.map,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _addlocation,
                backgroundColor: Colors.deepPurpleAccent,
                child: const Icon(
                  Icons.add_location,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _movetoNewLocation,
                backgroundColor: Colors.indigoAccent,
                child: const Icon(
                  Icons.location_city,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _gotohomedefault,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _gotolocation,
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.location_searching,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  void _changemaptype() {
    setState(() {
      currentmaptype =
          currentmaptype == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _addlocation() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('Default'),
          position: _defaultlocation.target,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(title: 'NooB', snippet: '5 Str')));
    });
  }

  void _movetoNewLocation() {
    const positionnew = LatLng(40.7128, -74.0060);
    _googlemapcntrl.animateCamera(CameraUpdate.newLatLngZoom(positionnew, 15));
    setState(() {
      const marker = Marker(
        markerId: MarkerId('Position'),
        position: positionnew,
      );
      _markers
        ..clear()
        ..add(marker);
    });
  }

  void _gotohomedefault() {
    const _defaultposition = LatLng(_defaultlat, _defaultlon);
    _googlemapcntrl
        .animateCamera(CameraUpdate.newLatLngZoom(_defaultposition, 15));
    setState(() {
      const marker = Marker(
        markerId: MarkerId('New Loaction'),
        position: _defaultposition,
      );
      _markers
        ..clear()
        ..add(marker);
    });
  }

  void _gotolocation() async {
    try {
      Uint8List imagedata = await getMarker();
      var location = await _locationtracker.getLocation();
      updateMarkerAndCircle(location, imagedata);
      if (_locationSubcription != null) {
        _locationSubcription.cancel();
      }
      _locationSubcription =
          _locationtracker.onLocationChanged.listen((newlocaldata) {
        if (_googlemapcntrl != null) {
          _googlemapcntrl.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(40.7128, -74.0060),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newlocaldata, imagedata);
        }
      });
    } catch (e) {}
  }

  void updateMarkerAndCircle(LocationData newlocalData, Uint8List imagedata) {
    LatLng latLng = LatLng(40.7128, -74.0060);
    setState(() {
      Marker mark = Marker(
        markerId: MarkerId('Home'),
        position: latLng,
        // rotation: newlocaldata.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(imagedata),
      );
      Circle circle = Circle(
        circleId: CircleId('Car'),
        // radius: newlocaldata.accuracy,
        zIndex: 1,
        strokeColor: Colors.blue,
        center: latLng,
        fillColor: Colors.blue.withAlpha(70),
      );
    });
  }
}
