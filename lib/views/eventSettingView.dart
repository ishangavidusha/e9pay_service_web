import 'package:e9pay_service/service/eventProvider.dart';
import 'package:e9pay_service/service/textProvider.dart';
import 'package:e9pay_service/utils/appData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventSettingsView extends StatefulWidget {
  @override
  _EventSettingsViewState createState() => _EventSettingsViewState();
}

class _EventSettingsViewState extends State<EventSettingsView> {
  AppData appData = AppData();
  EventProvider eventProvider;


  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  void initState() { 
    super.initState();
    titleController.text = "";
    subTitleController.text = "";
  }

  @override
  void dispose() { 
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devWidth = 1500;
    double devHeight = MediaQuery.of(context).size.height;
    eventProvider = Provider.of<EventProvider>(context);
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      width: devWidth,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              KText(
                                text: "Event Setup",
                                bold: true,
                                size: 0.04,
                              ),
                              KText(
                                text: "",
                                bold: false,
                                size: 0.02,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: devWidth,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: devWidth * 0.22,
                              child: Column(
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () async {
                                        FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["xlsx"]);

                                        if (filePickerResult.files.isNotEmpty) {
                                          PlatformFile platformFile = filePickerResult.files[0];
                                          
                                          eventProvider.selectNewFile(platformFile.bytes, platformFile.name);
                                        }

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: appData.linearGradientBt,
                                          boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.fileExcel, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Selected Excel Sheet",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      KText(
                                                        text: eventProvider.getFileName(),
                                                        bold: false,
                                                        size: 0.01,
                                                      ),
                                                      KText(
                                                        text: "    :   ",
                                                        bold: false,
                                                        size: 0.01,
                                                      ),
                                                      KText(
                                                        text: eventProvider.getCompetitorsSize().toString(),
                                                        bold: false,
                                                        size: 0.01,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: devHeight * 0.6,
                                    child: ListView.builder(
                                      itemCount: eventProvider.getCompetitors().length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: KText(
                                              text: index.toString(),
                                              size: 0.01,
                                              bold: true,
                                            ),
                                          ),
                                          title: KText(
                                            text: eventProvider.getCompetitors()[index].getName().toUpperCase(),
                                            bold: true,
                                            size: 0.01,
                                          ),
                                          subtitle: KText(
                                            text: eventProvider.getCompetitors()[index].getPhone(),
                                            bold: true,
                                            size: 0.01,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: devWidth * 0.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () async {
                                        FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);

                                        if (filePickerResult.files.isNotEmpty) {
                                          filePickerResult.files.forEach((element) {
                                            eventProvider.setImages(element.bytes);
                                          });
                                        }

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: appData.linearGradientBt,
                                          boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.images, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Gift Images",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: "Selected Images : " + eventProvider.getGiftIamges().length.toString(),
                                                    bold: false,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: devHeight * 0.6,
                                    child: ListView.builder(
                                      itemCount: eventProvider.getGiftIamges().length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          width: double.maxFinite,
                                          child: Stack(
                                            children: [
                                              Image.memory(
                                                eventProvider.getGiftIamges()[index],
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: IconButton(
                                                    icon: FaIcon(FontAwesomeIcons.timesCircle, color: appData.mainTextColor,), 
                                                    tooltip: "Remove Image",
                                                    onPressed: () {
                                                      eventProvider.removeGifts(index);
                                                    }
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: devWidth * 0.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: appData.linearGradientBt,
                                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.heading, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Set Event Title",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: eventProvider.getTitle(),
                                                    bold: true,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(color: appData.mainTextColor,),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: TextField(
                                            controller: titleController,
                                            cursorColor: appData.mainTextColor,
                                            maxLength: 120,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                              hintText: "Enter Title Here",
                                              hintStyle: TextStyle(
                                                color: appData.mainTextColor.withOpacity(0.5),
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 10, right: 10),
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
                                                    if (titleController.text != null && titleController.text.isNotEmpty) {
                                                      eventProvider.setTitle(titleController.text);
                                                    }
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
                                                          text: "Submit",
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: appData.linearGradientBt,
                                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.heading, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Set Event Sub Title",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: eventProvider.getSubTitle(),
                                                    bold: true,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(color: appData.mainTextColor,),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: TextField(
                                            controller: subTitleController,
                                            cursorColor: appData.mainTextColor,
                                            maxLength: 120,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                              hintText: "Enter Sub Title Here",
                                              hintStyle: TextStyle(
                                                color: appData.mainTextColor.withOpacity(0.5),
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 10, right: 10),
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
                                                    if (subTitleController.text != null && subTitleController.text.isNotEmpty) {
                                                      eventProvider.setSubTitle(subTitleController.text);
                                                    }
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
                                                          text: "Submit",
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: appData.linearGradientBt,
                                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.users, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Winner Count",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: "How many winners to be selected",
                                                    bold: false,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(color: appData.mainTextColor,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.minus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  if (eventProvider.getWinnerScale() > 1) {
                                                    eventProvider.setWinnerScale(eventProvider.getWinnerScale() - 1);
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              child: KText(
                                                text: eventProvider.getWinnerScale().toString(),
                                                bold: true,
                                                size: 0.05,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.plus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  eventProvider.setWinnerScale(eventProvider.getWinnerScale() + 1);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: devWidth * 0.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: appData.linearGradientBt,
                                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.random, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Shuffle Rounds",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: "Each Round is Approximately 150 ms.",
                                                    bold: false,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(color: appData.mainTextColor,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.minus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  if (eventProvider.getShuffleRounds() > 10) {
                                                    eventProvider.setShuffleRounds(eventProvider.getShuffleRounds() - 10);
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              child: KText(
                                                text: eventProvider.getShuffleRounds().toString(),
                                                bold: true,
                                                size: 0.05,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.plus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  eventProvider.setShuffleRounds(eventProvider.getShuffleRounds() + 10);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: appData.linearGradientBt,
                                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.first),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: FaIcon(FontAwesomeIcons.play, color: appData.mainTextColor, size: devWidth > devWidth ? 50 : devWidth * 0.04,)
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: "Image Interval",
                                                    bold: true,
                                                    size: 0.02,
                                                  ),
                                                  KText(
                                                    text: "Image Auto Play Interval",
                                                    bold: false,
                                                    size: 0.01,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(color: appData.mainTextColor,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.minus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  if (eventProvider.getAutoPlayInterval() > 2) {
                                                    eventProvider.setAutoPlayInterval(eventProvider.getAutoPlayInterval() - 2);
                                                  }
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              child: KText(
                                                text: eventProvider.getAutoPlayInterval().toString(),
                                                bold: true,
                                                size: 0.05,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.plus, color: appData.mainTextColor, size: devWidth > devWidth ? 36 : devWidth * 0.03,),
                                                onPressed: () {
                                                  eventProvider.setAutoPlayInterval(eventProvider.getAutoPlayInterval() + 2);
                                                },
                                              ),
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
                  ],
                ),
              ),
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
                    Navigator.pop(context);
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
                          text: "Go Back",
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
      ),
    );
  }
}