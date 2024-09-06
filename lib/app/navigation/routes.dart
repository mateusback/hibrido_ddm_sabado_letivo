import 'package:flutter/material.dart';

class Routes {
  static const String HOME = '/';

  static Map<String, Widget Function(BuildContext)> configRoutes() {
    return {
      HOME: (context) => HomePage(),
    };
  }
}
