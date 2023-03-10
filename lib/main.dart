import 'package:flutter/material.dart';
import 'package:retrofit_example/utils/service_locator.dart';

import 'app.dart';

void main() {
  ServiceLocator.init();
  runApp(const App());
}
