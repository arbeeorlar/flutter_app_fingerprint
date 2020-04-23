import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'fingerprint.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FINGERPRINT DEMO'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  FingerprintClass  fingerprintClass =  FingerprintClass();
  bool _hasFingerPrintSupport = false;
  List<BiometricType> _availableBuimetricType = List<BiometricType>();
  String _authorizedOrNot ;
  @override
  void initState()  {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Has FingerPrint Support : $_hasFingerPrintSupport"),
            Text(
                "List of Biometrics Support: ${_availableBuimetricType.toString()}"),
            Text("Authorized : $_authorizedOrNot"),
            RaisedButton(
              child: Text("Authorize Now"),
              color: Colors.green,
              onPressed: ()async{
                setState(() {});
                _hasFingerPrintSupport = await fingerprintClass.getBiometricsSupport();
                _availableBuimetricType =  await fingerprintClass.getAvailableSupport();
                _authorizedOrNot = await fingerprintClass.authenticateMe("FINGERPRINT DEMO");
              }
            ),
          ],
        ),
      ),
    );
  }
}
