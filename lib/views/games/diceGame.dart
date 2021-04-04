import 'package:e9pay_service/service/dbService.dart';
import 'package:e9pay_service/service/textProvider.dart';
import 'package:e9pay_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DiceGameView extends StatefulWidget {
  @override
  _DiceGameViewState createState() => _DiceGameViewState();
}

class _DiceGameViewState extends State<DiceGameView> {
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();

  SheetService _sheetService;
  AppData appData = AppData();
  bool isBackPressed = false;
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    _sheetService = Provider.of<SheetService>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: devHeight,
                  decoration: BoxDecoration(
                    color: appData.mainBgColor,
                  ),
                ),
              ),
              Positioned(
                width: devWidth,
                height: devHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: devWidth,
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 10
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KFText(
                              text: "E9PAY ",
                              bold: true,
                              size: 0.06,
                            ),
                            KFText(
                              text: "wjqreÿ l%Svd",
                              bold: true,
                              size: 0.06,
                              si: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: devWidth,
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: KFText(
                          text: "leg .eiSu",
                          bold: true,
                          size: 0.04,
                          si: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: devWidth,
                        height: devHeight * 0.5,
                        child: Lottie.asset(
                          "assets/rollingDice.json",
                          fit: BoxFit.fitHeight,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}