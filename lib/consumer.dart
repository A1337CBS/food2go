import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondRoute extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SecondRoute> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(25.322295, 51.437449);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  List<Marker> qnccMarker= [];
  
    _onAddMarkerButtonPressed() {
    setState(() {
      qnccMarker.add(
        Marker(
          markerId: MarkerId('qncc'),
          position: LatLng(25.322295, 51.437449),
          infoWindow: InfoWindow(
            title: 'Sale',
            snippet: 'Up to 50%',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qnccMarker.add(Marker(markerId: MarkerId('qncc'), 
    draggable: false, position: LatLng(25.322295, 51.437449), infoWindow: InfoWindow(
            title: 'Sale',
            snippet: 'Up to 50%',
          ),));

    qnccMarker.add(Marker(markerId: MarkerId('1'), 
    draggable: false, position: LatLng(25.312290, 51.437449), infoWindow: InfoWindow(
          title: 'Sale',
          snippet: 'Up to 25%',
        ),));

    qnccMarker.add(Marker(markerId: MarkerId('2'), 
    draggable: false, position: LatLng(25.324490, 51.436648), infoWindow: InfoWindow(
      title: 'Sale',
      snippet: 'Up to 10%',
    ),));

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Deals available'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
            
          ),
          markers: Set.from(qnccMarker),
          
        ),

      ),
    );
  }
}