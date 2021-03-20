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
                  Container(
                    width: devWidth,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: devWidth > 1200 ? 1200 * 0.3 : devWidth * 0.3,
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
                                          child: FaIcon(FontAwesomeIcons.fileExcel, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,)
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
                                              KText(
                                                text: eventProvider.getFileName(),
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
                          width: devWidth > 1200 ? 1200 * 0.3 : devWidth * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async {
                                    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.image);

                                    if (filePickerResult.files.isNotEmpty) {
                                      PlatformFile platformFile = filePickerResult.files[0];
                                      
                                      eventProvider.setImages(platformFile.bytes);
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
                                          child: FaIcon(FontAwesomeIcons.images, color: appData.mainTextColor, size: devWidth > 1200 ? 50 : devWidth * 0.04,)
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: IconButton(
                                                icon: FaIcon(FontAwesomeIcons.timesCircle), 
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
                        )
                      ],
                    ),
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