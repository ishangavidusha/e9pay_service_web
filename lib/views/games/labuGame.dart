import 'package:e9pay_service/service/dbService.dart';
import 'package:e9pay_service/service/textProvider.dart';
import 'package:e9pay_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LabuGameView extends StatefulWidget {
  @override
  _LabuGameViewState createState() => _LabuGameViewState();
}

class _LabuGameViewState extends State<LabuGameView> {
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();

  SheetService _sheetService;
  AppData appData = AppData();
  bool isBackPressed = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    oneController.text = "";
    twoController.text = "";
    threeController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    oneController.dispose();
    twoController.dispose();
    threeController.dispose();
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
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
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
                        text: ".ia,nq f.äfha weg .kka lsÍu",
                        bold: true,
                        size: 0.04,
                        si: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: devWidth,
                      child: Image.network("https://i.ibb.co/qNTH40Z/labu.jpg", fit: BoxFit.fitWidth,),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: devWidth,
                      child: Column(
                        children: [
                          KFText(
                            text: "Tnf.a ms,s;=re my; ysia fldgqj, i|yka lrkak'",
                            bold: true,
                            size: 0.04,
                            si: true,
                            textAlign: TextAlign.center,
                          ),
                          KFText(
                            text: "Tng wjia;d ;=kla ysñfõ'",
                            bold: true,
                            size: 0.04,
                            si: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (RawKeyEvent event){
                          if(event.character != null && event.character == "Backspace") {
                            setState(() {
                              isBackPressed = true;
                            });
                          } else {
                            setState(() {
                              isBackPressed = false;
                            });
                          }
                        },
                        child: TextField(
                          controller: oneController,
                          cursorColor: appData.mainTextColor,
                          keyboardType: TextInputType.number,
                          enabled: _sheetService != null ? !_sheetService.isLabuPlayed() : false,
                          decoration: InputDecoration(
                            labelText: "Answer One",
                            labelStyle: appData.getMainTextStyle(),
                            hintText: "Enter First Answer Here",
                            hintStyle: TextStyle(
                              color: appData.mainTextColor.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: appData.mainTextColor)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: appData.mainTextColor,
                                width: 2.0
                              )
                            ),
                            focusColor: appData.mainTextColor,
                            icon: FaIcon(FontAwesomeIcons.dotCircle, color: appData.mainTextColor, size: devWidth * 0.06,),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (RawKeyEvent event){
                          if(event.character != null && event.character == "Backspace") {
                            setState(() {
                              isBackPressed = true;
                            });
                          } else {
                            setState(() {
                              isBackPressed = false;
                            });
                          }
                        },
                        child: TextField(
                          controller: twoController,
                          cursorColor: appData.mainTextColor,
                          keyboardType: TextInputType.number,
                          enabled: _sheetService != null ? !_sheetService.isLabuPlayed() : false,
                          decoration: InputDecoration(
                            labelText: "Answer Two",
                            labelStyle: appData.getMainTextStyle(),
                            hintText: "Enter Second Answer Here",
                            hintStyle: TextStyle(
                              color: appData.mainTextColor.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: appData.mainTextColor)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: appData.mainTextColor,
                                width: 2.0
                              )
                            ),
                            focusColor: appData.mainTextColor,
                            icon: FaIcon(FontAwesomeIcons.dotCircle, color: appData.mainTextColor, size: devWidth * 0.06,),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (RawKeyEvent event){
                          if(event.character != null && event.character == "Backspace") {
                            setState(() {
                              isBackPressed = true;
                            });
                          } else {
                            setState(() {
                              isBackPressed = false;
                            });
                          }
                        },
                        child: TextField(
                          controller: threeController,
                          cursorColor: appData.mainTextColor,
                          keyboardType: TextInputType.number,
                          enabled: _sheetService != null ? !_sheetService.isLabuPlayed() : false,
                          decoration: InputDecoration(
                            labelText: "Answer Three",
                            labelStyle: appData.getMainTextStyle(),
                            hintText: "Enter Third Answer Here",
                            hintStyle: TextStyle(
                              color: appData.mainTextColor.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: appData.mainTextColor)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: appData.mainTextColor,
                                width: 2.0
                              )
                            ),
                            focusColor: appData.mainTextColor,
                            icon: FaIcon(FontAwesomeIcons.dotCircle, color: appData.mainTextColor, size: devWidth * 0.06,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
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
                            if (_sheetService.isLabuPlayed()) {
                              showAlert("Tn oekgu;a fuu ;rÕhg iynd.S ù we;", "oekqï§uhs");
                            } else {
                              if (oneController.text.length > 1 && twoController.text.length > 1 && threeController.text.length > 1) {
                                await _sheetService.setLabuValue("[" + oneController.text + "," +  twoController.text + "," + threeController.text + "]");
                              } else {
                                showAlert("lreKdlr ms,s;=re ;=ku we;=,;a lrkak", "oekqï§uhs");
                              }
                            }
                          },
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Column(
                              children: [
                                KFText(
                                  text: ";yjqre lrkak",
                                  bold: true,
                                  size: 0.05,
                                  si: true,
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
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.arrowLeft, color: appData.mainTextColor, size: devWidth * 0.06,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
      ),
    );
  }
}