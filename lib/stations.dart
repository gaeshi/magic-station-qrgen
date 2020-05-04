import 'package:flutter/material.dart';
import 'package:magicstationqrgen/station.dart';

List<Station> stations = [
  Station(
      name: 'Main Office',
      prefix: 'DAI-0001-',
      min: 1,
      max: 20,
      length: 4,
      icon: Icon(Icons.business)),
  Station(
      name: 'Shin-Kiba',
      prefix: 'Y-024-',
      min: 1,
      max: 170,
      length: 5,
      icon: Icon(Icons.subway)),
  Station(
      name: 'Tokyo',
      prefix: 'JT-01-',
      min: 1,
      max: 20,
      length: 5,
      icon: Icon(Icons.directions_railway)),
];
