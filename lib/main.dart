import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(const MyApp());
}
