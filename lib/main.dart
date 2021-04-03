import 'package:e9pay_service/service/dbService.dart';
import 'package:e9pay_service/service/eventProvider.dart';
import 'package:e9pay_service/views/gameHomeView.dart';
import 'package:e9pay_service/views/gameLoginView.dart';
import 'package:e9pay_service/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EventProvider>(
          create: (_) => EventProvider(),
        ),
        ChangeNotifierProvider<SheetService>(
          create: (_) => SheetService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E9pay Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/game': (context) => Consumer<SheetService>(
          builder: (context, sheetService, _) {
            if (sheetService.isLogin()) {
              return GameHomeView();
            } else {
              return GameLogInView();
            }
          }
        ),
      },
    );
  }
}