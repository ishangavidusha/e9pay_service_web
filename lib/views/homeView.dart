import 'package:e9pay_service/service/eventProvider.dart';
import 'package:e9pay_service/service/textProvider.dart';
import 'package:e9pay_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppData appData = AppData();
  EventProvider eventProvider;
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: devWidth,
              height: devHeight,
              decoration: BoxDecoration(
                color: appData.mainBgColor,
              ),
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: devWidth,
                    child: Center(
                      child: Column(
                        children: [
                          KText(
                            text: eventProvider.getTitle(),
                            bold: true,
                            size: 0.04,
                          ),
                          KText(
                            text: eventProvider.getSubTitle(),
                            bold: false,
                            size: 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: devWidth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}