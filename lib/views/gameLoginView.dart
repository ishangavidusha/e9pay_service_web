import 'package:device_info_plus/device_info_plus.dart';
import 'package:e9pay_service/service/dbService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../service/textProvider.dart';
import '../utils/appData.dart';

class GameLogInView extends StatefulWidget {
  @override
  _GameLogInViewState createState() => _GameLogInViewState();
}

class _GameLogInViewState extends State<GameLogInView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  WebBrowserInfo webBrowserInfo;
  SheetService _sheetService;
  AppData appData = AppData();
  bool isBackPressed = false;
  String errorMsg = "";
  bool mobile = true;

  @override
  void initState() { 
    super.initState();
    nameController.text = "";
    phoneController.text = "";
    phoneController.addListener(_phoneListener);
    checkBrowser();
  }

  void checkBrowser() async {
    webBrowserInfo = await deviceInfo.webBrowserInfo;
    print('Running on ${webBrowserInfo.platform}'); 
    if (webBrowserInfo.platform.contains("Win32") || webBrowserInfo.platform.contains("Mac")) {
      setState(() {
        mobile = false;
      });
    } else {
      setState(() {
        mobile = true;
      });
    }
  }

  @override
  void dispose() { 
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool nameValidate() {
    if (nameController.text != null && nameController.text.length > 0) {
      nameController.text = nameController.text.toUpperCase();
      return true;
    } else {
      setState(() {
        errorMsg = "lreKdlr ku we;=,;a lrkak";
      });
      return false;
    }
  }

  bool phoneValidate() {
    if (phoneController.text != null && phoneController.text.length == 11) {
      return true;
    } else {
      setState(() {
        errorMsg = "ÿrl:k wxlh ksjerÈ wdlD;shg we;=,;a lrkak";
      });
      return false;
    }
  }

  _phoneListener() {
    if (!isBackPressed) {
      if (phoneController.text.length > 11) {
        phoneController.value = TextEditingValue(
          text: phoneController.text.substring(0, 11),
          selection: TextSelection.collapsed(offset: phoneController.text.length),
        );
      }
    }
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
    return mobile ? Scaffold(
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        padding: EdgeInsets.all(20),
                        width: devWidth,
                        decoration: BoxDecoration(
                          gradient: appData.linearGradientBt,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                        ),
                        child: Column(
                          children: [
                            KFText(
                              text: ";rÕhg msúiSug Tnf.a ku yd ÿrl:k wxlh ,ndfokak",
                              bold: true,
                              size: 0.04,
                              si: true,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: nameController,
                                cursorColor: appData.mainTextColor,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: appData.getMainTextStyle(),
                                  hintText: "Enter Name Here",
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
                                  icon: FaIcon(FontAwesomeIcons.userAlt, color: appData.mainTextColor, size: devWidth * 0.06,),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  controller: phoneController,
                                  cursorColor: appData.mainTextColor,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    labelStyle: appData.getMainTextStyle(),
                                    hintText: "Enter Phone Number Here",
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
                                    icon: FaIcon(FontAwesomeIcons.phone, color: appData.mainTextColor, size: devWidth * 0.06,),
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
                                    if (nameValidate()) {
                                      if (phoneValidate()) {
                                        await _sheetService.loginOrRegister(nameController.text, phoneController.text);
                                      } else {
                                        showAlert(errorMsg, "oekqï§uhs");
                                      }
                                    } else {
                                      showAlert(errorMsg, "oekqï§uhs");
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
                                          text: "we;=¿jkak",
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                KFText(
                                  text: ";rÕhg iyNd.S ùfï§",
                                  bold: true,
                                  size: 0.04,
                                  si: true,
                                ),
                                KFText(
                                  text: " E9PAY ",
                                  bold: true,
                                  size: 0.04,
                                ),
                              ],
                            ),
                            KFText(
                              text: ",shdmÈxÑ; ÿrl:k wxlh ,ndÈh hq;= jk w;r",
                              bold: true,
                              size: 0.04,
                              si: true,
                            ),
                            KFText(
                              text: "ÿrl:k wxlh fjkia ùul§ ;rÕ jdrh wfydais jkq we;'",
                              bold: true,
                              size: 0.04,
                              si: true,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
        ),
      ),
    ) : Scaffold(
      backgroundColor: appData.mainBgColor,
      body: Container(
        width: devWidth,
        height: devHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KFText(
                text: "fuu fjímsgqj cx.u ÿrl:k i|yd mukla iyh olajhs'",
                bold: true,
                size: 0.04,
                si: true,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                      ),
                      child: Image.asset("assets/slLogo.png", fit: BoxFit.contain, scale: 6,)
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
    );
  }
}