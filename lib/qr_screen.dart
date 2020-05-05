import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:magicstationqrgen/dot_blocks.dart';
import 'package:magicstationqrgen/station.dart';
import 'package:magicstationqrgen/stations.dart';

class QrScreen extends StatefulWidget {
  final List<BottomNavigationBarItem> bnbItems =
      List<BottomNavigationBarItem>();
  final Station station;

  QrScreen({Key key, this.station}) : super(key: key) {
    for (var s in stations) {
      bnbItems.add(BottomNavigationBarItem(icon: s.icon, title: Text(s.name)));
    }
  }

  @override
  _QrScreenState createState() => _QrScreenState(station);
}

class _QrScreenState extends State<QrScreen> {
  Station _station;
  String _code;
  int _currentIndex = 0;

  _QrScreenState(this._station);

  void _generateNewCode() {
    setState(() {
      _code = _station.generateNewCode();
    });
  }

  void _changeStation(int index) {
    setState(() {
      _currentIndex = index;
      _station = stations[index];
    });
    _generateNewCode();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      backgroundColor: Color(0xff110022),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              _station.name ?? "unknown",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Geostar',
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            DotBlockWithQrCode(code: _code),
            Text(
              _code ?? 'Magic Station QR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bungee Inline',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeStation,
        currentIndex: _currentIndex,
        backgroundColor: Colors.red.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0x77110022),
        items: widget.bnbItems,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: _generateNewCode,
        tooltip: 'Generate new code',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
