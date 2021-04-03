import 'package:e9pay_service/service/dbService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../service/textProvider.dart';
import '../service/textProvider.dart';
import '../utils/appData.dart';

class GameHomeView extends StatefulWidget {
  @override
  _GameHomeViewState createState() => _GameHomeViewState();
}

class _GameHomeViewState extends State<GameHomeView> {
  AppData appData = AppData();
  SheetService _sheetService;

  
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    _sheetService = Provider.of<SheetService>(context);
    return Scaffold(
      body: Stack(
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
            height: devHeight,
            width: devWidth,
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
                          size: 0.05,
                        ),
                        KFText(
                          text: "wjqreÿ l%Svd",
                          bold: true,
                          size: 0.05,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KFText(
                          text: "Online ",
                          bold: true,
                          size: 0.03,
                        ),
                        KFText(
                          text: "wjqreÿ W;aijh",
                          bold: true,
                          size: 0.03,
                          si: true,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: devWidth,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: appData.linearGradientBt,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: ListTile(
                            leading: FaIcon(FontAwesomeIcons.dice, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,),
                            title: KFText(
                              text: "leg .eiSu",
                              bold: true,
                              size: 0.04,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g tlajrla muKla iynd.S úh yelshs",
                              bold: true,
                              size: 0.02,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: appData.linearGradientBt,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: ListTile(
                            leading: FaIcon(FontAwesomeIcons.bomb, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,),
                            title: KFText(
                              text: "lKd uqÜáh ì£u",
                              bold: true,
                              size: 0.04,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g tlajrla muKla iynd.S úh yelshs",
                              bold: true,
                              size: 0.02,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: appData.linearGradientBt,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: ListTile(
                            leading: FaIcon(FontAwesomeIcons.eye, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,),
                            title: KFText(
                              text: "w,shg wei ;eîu",
                              bold: true,
                              size: 0.04,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g ;=kajrla iynd.Súh yel",
                              bold: true,
                              size: 0.02,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: appData.linearGradientBt,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: ListTile(
                            leading: FaIcon(FontAwesomeIcons.lemon, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,),
                            title: KFText(
                              text: ".ia,nq f.äfha weg .kka lsÍu",
                              bold: true,
                              size: 0.04,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g ;=kajrla iynd.Súh yel",
                              bold: true,
                              size: 0.02,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: appData.linearGradientBt,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  KFText(
                                    text: ";rÕlre",
                                    bold: true,
                                    size: 0.04,
                                    si: true,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  KFText(
                                    text: "ku( ",
                                    bold: true,
                                    size: 0.03,
                                    si: true,
                                  ),
                                  KFText(
                                    text: _sheetService.getName(),
                                    bold: true,
                                    size: 0.03,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  KFText(
                                    text: "ÿrl:k wxlh( ",
                                    bold: true,
                                    size: 0.03,
                                    si: true,
                                  ),
                                  KFText(
                                    text: _sheetService.getPhone(),
                                    bold: true,
                                    size: 0.03,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 40,
                bottom: 20,
                right: 40,
              ),
              width: devWidth,
              height: 150,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                    ),
                    child: Image.asset("assets/slLogo.png", fit: BoxFit.contain,)
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