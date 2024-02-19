import 'package:flutter/material.dart';
import 'feature/0Start/go_bharat_rider.dart';
import 'utils/functions/initialize.dart';

Future<void> main() async {
  await initialize();
  runApp(const GoBharatRider());
}
