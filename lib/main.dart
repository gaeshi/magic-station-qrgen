import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:magicstationqrgen/qr_screen.dart';
import 'package:magicstationqrgen/stations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Station QR',
      home: QrScreen(station: stations.first),
    );
  }
}
