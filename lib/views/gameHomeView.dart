import 'package:e9pay_service/service/dbService.dart';
import 'package:e9pay_service/views/games/diceGame.dart';
import 'package:e9pay_service/views/games/eleGame.dart';
import 'package:e9pay_service/views/games/labuGame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void initState() {
    super.initState();
    Provider.of<SheetService>(context, listen: false).getAppData();
  }

  void showAlert(String msg, String title) {
    Alert(
      context: context,
      style: AlertStyle(
        animationType: AnimationType.fromBottom,
        isCloseButton: false,
        isOverlayTapDismiss: true,
        descStyle: appData.getMainTextStyle().copyWith(
          fontWeight: FontWeight.normal,
          fontFamily: "FMBindumathi",
        ),
        animationDuration: Duration(milliseconds: 300),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: appData.getMainTextStyle().copyWith(
          fontWeight: FontWeight.bold,
          fontFamily: "FMBindumathi",
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0x55000000),
        alertElevation: 0,
        alertAlignment: Alignment.center,
      ),
      type: AlertType.info,
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: KFText(
            text: "yß",
            bold: true,
            size: 0.04,
            si: true,
          ),
          onPressed: () => Navigator.pop(context),
          color: appData.mainBgColor,
          radius: BorderRadius.circular(20),
        ),
      ],
    ).show();
  }

  
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KFText(
                          text: "Online ",
                          bold: true,
                          size: 0.04,
                        ),
                        KFText(
                          text: "wjqreÿ W;aijh",
                          bold: true,
                          size: 0.04,
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
                            leading: FaIcon(FontAwesomeIcons.dice, color: appData.mainTextColor, size: devWidth * 0.06,),
                            title: KFText(
                              text: "leg .eiSu",
                              bold: true,
                              size: 0.05,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g tlajrla muKla iynd.S úh yelshs",
                              bold: true,
                              size: 0.03,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                            onTap: () {
                              if (kReleaseMode) {
                                showAlert("fuu ;rÕh wfma%,a 12 fjks Èk isg wdrïn fõ'", "oekqï§uhs");
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiceGameView()),
                                );
                              }
                            },
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
                            leading: FaIcon(FontAwesomeIcons.bomb, color: appData.mainTextColor, size: devWidth * 0.06,),
                            title: KFText(
                              text: "lKd uqÜáh ì£u",
                              bold: true,
                              size: 0.05,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g tlajrla muKla iynd.S úh yelshs",
                              bold: true,
                              size: 0.03,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                            onTap: () {
                              if (kReleaseMode) {
                                showAlert("fuu ;rÕh wfma%,a 12 fjks Èk isg wdrïn fõ'", "oekqï§uhs");
                              } else {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => DiceGameView()),
                                // );
                              }
                            },
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
                            leading: FaIcon(FontAwesomeIcons.eye, color: appData.mainTextColor, size: devWidth * 0.06,),
                            title: KFText(
                              text: "w,shg wei ;eîu",
                              bold: true,
                              size: 0.05,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g ;=kajrla iynd.Súh yel",
                              bold: true,
                              size: 0.03,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EleGameView()),
                              );
                            },
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
                            leading: FaIcon(FontAwesomeIcons.lemon, color: appData.mainTextColor, size: devWidth * 0.06,),
                            title: KFText(
                              text: ".ia,nq f.äfha weg .kka lsÍu",
                              bold: true,
                              size: 0.05,
                              si: true,
                            ),
                            subtitle: KFText(
                              text: "tla whl=g ;=kajrla iynd.Súh yel",
                              bold: true,
                              size: 0.03,
                              si: true,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LabuGameView()),
                              );
                            },
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KFText(
                                    text: ";rÕh wdrïN lsÍug fmr my; fnd;a;u ;o lr",
                                    bold: true,
                                    size: 0.03,
                                    si: true,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      KFText(
                                        text: "wmf.a ks,",
                                        bold: true,
                                        size: 0.03,
                                        si: true,
                                      ),
                                      KFText(
                                        text: " Facebook ",
                                        bold: true,
                                        size: 0.03,
                                      ),
                                      KFText(
                                        text: "msgfjys we;s",
                                        bold: true,
                                        size: 0.03,
                                        si: true,
                                      ),
                                    ],
                                  ),
                                  KFText(
                                    text: "wjqreÿ l%Svd fmdiaÜ tl",
                                    bold: true,
                                    size: 0.03,
                                    si: true,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      KFText(
                                        text: "Share ",
                                        bold: true,
                                        size: 0.03,
                                      ),
                                      KFText(
                                        text: "lrkak'",
                                        bold: true,
                                        size: 0.03,
                                        si: true,
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: appData.linearGradientBt,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                  ),
                                  boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                  ),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      // String fbProtocolUrl = "fb://page/E9pay.lk";
                                      String fallbackUrl = "https://www.facebook.com/E9pay.lk";
                                      if (await canLaunch(fallbackUrl)) {
                                        bool result = await _sheetService.setFBShare(_sheetService.getFBShare() + 1);
                                        if (result) {
                                          await launch(fallbackUrl, );
                                          await launch(fallbackUrl, forceSafariVC: false);
                                        }
                                      } else {
                                        showAlert("ndú;fha .eg¿jla we;s úh'", "oekqï§uhs");
                                      }
                                    },
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                child: FaIcon(FontAwesomeIcons.facebook, color: appData.mainTextColor, size: devWidth * 0.06,),
                                              ),
                                              KFText(
                                                text: "Share ",
                                                bold: true,
                                                size: 0.05,
                                              ),
                                              KFText(
                                                text: "lrkak",
                                                bold: true,
                                                size: 0.05,
                                                si: true,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                    size: 0.05,
                                    si: true,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KFText(
                                    text: "ku( ",
                                    bold: true,
                                    size: 0.04,
                                    si: true,
                                  ),
                                  KFText(
                                    text: _sheetService.getName(),
                                    bold: true,
                                    size: 0.04,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KFText(
                                    text: "ÿrl:k wxlh( ",
                                    bold: true,
                                    size: 0.04,
                                    si: true,
                                  ),
                                  KFText(
                                    text: _sheetService.getPhone(),
                                    bold: true,
                                    size: 0.04,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                          ),
                          child: Image.asset("assets/slLogo.png", fit: BoxFit.contain, scale: devWidth * 0.016,)
                        ),
                        KFText(
                          text: "E9pay Remittance Sri Lanka",
                          bold: true,
                          size: 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.phoneSquare, color: appData.mainTextColor, size: devWidth * 0.03,),
                            SizedBox(
                              width: 10,
                            ),
                            KFText(
                              text: "1899-6943",
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
          ),
          Positioned(
            width: devWidth,
            height: devHeight,
            child: _sheetService.getLoading() ? Container(
              width: devWidth,
              height: devHeight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              ),
              child: Center(
                child: Lottie.asset(
                  "assets/loading.json",
                  fit: BoxFit.fitWidth,
                  animate: _sheetService.getLoading(),
                ),
              ),
            ) : Container(),
          ),
        ],
      ),
    );
  }
}