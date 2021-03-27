import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e9pay_service/models/competitor.dart';
import 'package:e9pay_service/service/eventProvider.dart';
import 'package:e9pay_service/service/textProvider.dart';
import 'package:e9pay_service/utils/appData.dart';
import 'package:e9pay_service/views/eventSettingView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppData appData = AppData();
  EventProvider eventProvider;
  bool running = false;
  bool animate = false;

  void selectWinners() async {
    List<Competitor> temp = [];
    Random random = Random();
    int selectionRounds = eventProvider.getShuffleRounds();

    if (eventProvider.getCompetitorsSize() > 10 && !running) {
      setState(() {
        running = true;   
      });
      for (int i = 0; i < eventProvider.getWinnerScale(); i++) {
        temp.add(eventProvider.getCompetitors()[random.nextInt(eventProvider.getCompetitorsSize())]);
      }

      eventProvider.setTempWinners(temp);

      for (int i = 0; i < selectionRounds; i++) {
        for (int i = 0; i < eventProvider.getWinnerScale(); i++) {
          eventProvider.updateWinners(eventProvider.getCompetitors()[random.nextInt(eventProvider.getCompetitorsSize())], i);
        }
        await Future.delayed(Duration(milliseconds: 150));
      }

      setState(() {
        animate = true;
      });
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        animate = false;
        running = false;
      });
    } 
  }



  @override
  Widget build(BuildContext context) {
    double devWidth = 1600;
    double devHeight = MediaQuery.of(context).size.height;
    eventProvider = Provider.of<EventProvider>(context);
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
            bottom: 0,
            left: 0,
            height: devHeight,
            child: animate ? Container(
              height: devHeight,
              child: Lottie.asset(
                "assets/fierworks.json",
                fit: BoxFit.cover,
                animate: animate,
              ),
            ) : Container(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            height: devHeight,
            child: animate ? Container(
              height: devHeight,
              child: Lottie.asset(
                "assets/fierworks.json",
                fit: BoxFit.cover,
                animate: animate,
              ),
            ) : Container(),
          ),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width < 1200 ? 1200 : MediaQuery.of(context).size.width,
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
                      width: MediaQuery.of(context).size.width < 1400 ? 1400 : MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 600,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: appData.linearGradientBt,
                                  boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: KText(
                                        text: "WINNERS",
                                        bold: true,
                                        size: 0.03,
                                      ),
                                    ),
                                    Divider(color: appData.mainTextColor,),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: eventProvider.getWinnerScale(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: ListTile(
                                            leading: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: FaIcon(FontAwesomeIcons.trophy, color: appData.mainTextColor, size: devWidth > 1200 ? 36 : devWidth * 0.03,),
                                            ),
                                            title: eventProvider.getWinners().length < index + 1 ? 
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "To Be Selected",
                                                    bold: true,
                                                    size: 0.015,
                                                  ),
                                                  KText(
                                                    text: "",
                                                    bold: true,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ) :
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: eventProvider.getWinners()[index].getName().toUpperCase(),
                                                    bold: true,
                                                    size: 0.015,
                                                  ),
                                                  KText(
                                                    text: eventProvider.getWinners()[index].getPhone(),
                                                    bold: true,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
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
                                    onTap: () {
                                      selectWinners();
                                    },
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: Column(
                                        children: [
                                          KText(
                                            text: "Start Selection",
                                            bold: true,
                                            size: 0.02,
                                          ),
                                        ],
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 600,
                                height: 600,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: appData.linearGradientBt,
                                  boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: KText(
                                        text: "GIFTS",
                                        bold: true,
                                        size: 0.03,
                                      ),
                                    ),
                                    Divider(color: appData.mainTextColor,),
                                    eventProvider.getGiftIamges().length != 0 ? CarouselSlider(
                                      items: eventProvider.getGiftIamges().map((e) => Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          child: Image.memory(e, fit: BoxFit.contain,),
                                        ),
                                      )).toList(),
                                      options: CarouselOptions(
                                        height: 450,
                                        aspectRatio: 4/3,
                                        viewportFraction: 0.8,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ) : Container(
                                      padding: EdgeInsets.all(20),
                                      child: KText(
                                        text: "Images Not Selected",
                                        bold: true,
                                        size: 0.02,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 600,
                                height: 100,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: appData.linearGradientBt,
                                  boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      width: 120,
                                      decoration: BoxDecoration(
                                        boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first)
                                      ),
                                      child: Image.asset("assets/e9payLogo.png", fit: BoxFit.contain,),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          KText(
                                            text: "E9pay Remittance",
                                            bold: true,
                                            size: 0.02,
                                          ),
                                          KText(
                                            text: "E9pay Overseas Remittance Service",
                                            bold: true,
                                            size: 0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(FontAwesomeIcons.phone, color: appData.mainTextColor, size: devWidth * 0.015),
                                    ),
                                    Container(
                                      child: KText(
                                        text: "1899-6943",
                                        bold: true,
                                        size: 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            height: devHeight,
            width: MediaQuery.of(context).size.width * 0.5,
            child: animate ? Container(
              height: devHeight,
              child: Lottie.asset(
                "assets/fierworks2.json",
                fit: BoxFit.cover,
                animate: animate,
              ),
            ) : Container(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            height: devHeight,
            child: animate ? Container(
              height: devHeight,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Lottie.asset(
                "assets/fierworks2.json",
                fit: BoxFit.cover,
                animate: animate,
              ),
            ) : Container(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventSettingsView()),
                    );
                  },
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        KText(
                          text: "Settings",
                          bold: true,
                          size: 0.02,
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}