import 'package:flutter/material.dart';
/*
class SupplierRoute extends StatelessWtypeget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supplier Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
*/

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class SupplierRoute extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<SupplierRoute> {
  String result = "Barcode number: ";
  String barcode = "";
  static final CREATE_POST_URL = 'https://teambeta.iotsolutionbuilder.ooredoo.qa/alarm/alarms';
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();

  var now = new DateTime.now();
  print(now.toIso8601String());
  
                 var body = convert.jsonEncode( 
                    {
	"source": {
    	"id": "119" 
	},
    "type": "TestAlarm",
    "text": "Pepsi Can is close to expiry",
    "severity": "CRITICAL",
    "status": "ACTIVE",
    "time": now.toIso8601String()
              }
            );


        var response_http =  await http.post(Uri.encodeFull(CREATE_POST_URL), body: convert.utf8.encode(body), headers: {
         // "Accept": "application/vnd.com.nsn.cumulocity.measurement+json",
          "Content-type": "application/json",
          "Authorization":"Basic dXNlcjpBZG1pbi4xMjM=",
        });
        
        

        print('Response status: ${response_http.statusCode}');
        print('Response body: ${response_http.body}');
      setState(() {
        barcode = qrResult+"\n\nPlease visit Ooredoo IoT Platform to see the alarm generated!";
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });

                    
 
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(
          result+barcode,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


