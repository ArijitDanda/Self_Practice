import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMAptry extends StatefulWidget {
  const GoogleMAptry({super.key});

  @override
  State<GoogleMAptry> createState() => _GoogleMAptryState();
}

class _GoogleMAptryState extends State<GoogleMAptry> {
  static const double _defaultlat = 27.2046;
  static const double _defaultlon = 77.4977;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  late  BitmapDescriptor mapmarker;
  List<Marker> markers = [];
  int id = 1;
  late final GoogleMapController _googlemapcntrl;
  MapType currentmaptype = MapType.normal;
  static const CameraPosition _defaultlocation =
      CameraPosition(target: LatLng(_defaultlat, _defaultlon), zoom: 15);
  @override
  void initState() {
    super.initState();
    custommarker();
  }

  void custommarker() async {
    mapmarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/car.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: Stack(children: [
        GoogleMap(
          myLocationButtonEnabled: true,
          polylines: _polyline,
          onMapCreated: (controller) => _googlemapcntrl = controller,
          initialCameraPosition: _defaultlocation,
          mapType: currentmaptype,
          onTap: ((LatLng latlng) {
            _addlocation(latlng);
          }),
          markers: markers.map((e) => e).toSet(),
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
                onPressed: () {},
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

  void _addlocation(LatLng latlng) {
    setState(() {
      Marker newmarker = Marker(
          markerId: MarkerId('${id}'),
          position: LatLng(latlng.latitude, latlng.longitude),
          icon: mapmarker,
          infoWindow: const InfoWindow(title: 'NooB', snippet: '5 Str'));
      print('${latlng}');
      markers.add(newmarker);
      id = id + 1;
      // setState(() {});
      // _markers.add(Marker(
      //     markerId: const MarkerId('Default'),
      //     position: _defaultlocation.target,
      //     icon: BitmapDescriptor.defaultMarker,
      //     infoWindow: const InfoWindow(title: 'NooB', snippet: '5 Str')));
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
}
