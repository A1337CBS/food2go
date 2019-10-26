import 'package:flutter/material.dart';
import 'consumer.dart';
import 'supplier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Choose your preference'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.3, 0.4, 0.5, 0.7, 0.8, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.blue[500],
            Colors.blue[300],
            Colors.blue[200],
            Colors.white,
            Colors.green[400],
            Colors.green[600],
            Colors.green[700],
          ],
        ),
      ),
      child: Center(
         child: Container(
            height: 400.0,
            width: 300.0,
            padding: EdgeInsets.all(16.0),
            decoration: new BoxDecoration(
                  color: Colors.white,
                      border: Border(
                      top: BorderSide(width: 1.0, color: Colors.green),
                      left: BorderSide(width: 1.0, color: Colors.green),
                      right: BorderSide(width: 1.0, color: Colors.green),
                      bottom: BorderSide(width: 1.0, color: Colors.green),
                    ),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft:const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                  )
                ),
            child: Center(
                child: Column(
          mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center)
          children: <Widget>[
            new Text("I am a:", style: TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  ),),
            new Padding(padding: EdgeInsets.all(16.0),),
            Column(
              children: <Widget>[
                /*
                    new RaisedButton(
                      child: new Text('Supplier'),
                      color: Colors.green,
                      textColor: Colors.white,
                      splashColor: Colors.blue,
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SupplierRoute()),
                          );
                        }
                    ),*/
                     ButtonTheme(
                      minWidth: 200.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        splashColor: Colors.blue,
                        onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SupplierRoute()),
                          );
                        },
                        child: Text("Supplier"),
                      ),
                    ),

/*
                    new RaisedButton(
                      child: new Text('Consumer'),
                      color: Colors.green,
                      textColor: Colors.white,
                      splashColor: Colors.blue,
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        }
                    ),
*/
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        splashColor: Colors.blue,
                        onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Text("Consumer"),
                      ),
                    ),


                ]
            ),
          ],
        ),
            ),
          ),
      ),
    ),

    );
  }
}
