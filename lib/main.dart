import 'package:e9pay_service/service/eventProvider.dart';
import 'package:e9pay_service/views/eventSettingView.dart';
import 'package:e9pay_service/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E9pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventSettingsView(),
    );
  }
}