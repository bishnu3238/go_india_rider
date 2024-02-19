import 'package:flutter/material.dart';

class NavigatorKey {
  static final subKey = GlobalKey<NavigatorState>(debugLabel: 'sub-key');
  static final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root-key');
  static final indexKey = GlobalKey<NavigatorState>(debugLabel: 'index-key');
  static final shellKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');
}
