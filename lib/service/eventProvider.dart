import 'dart:typed_data';
import 'package:e9pay_service/models/competitor.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class EventProvider with ChangeNotifier {
  List<Competitor> _competitors = [];
  int _winnerScale = 3;
  List<Uint8List> _giftImages = [];
  String _eventTitle = "This is title";
  String _eventSubTitle = "This is sub title";
  String _selectedFile = "File Not Selected!";

  String getTitle() => _eventTitle;
  String getSubTitle() => _eventSubTitle;
  List<Competitor> getCompetitors() => _competitors;
  List<Competitor> getWinners(){
    return _competitors.where((element) => element.isWin());
  }
  int getWinnerScale() => _winnerScale;

  String getFileName() {
    print(_selectedFile);
    return _selectedFile;
  }

  void update() {
    notifyListeners();
  }

  void updateWinners(Competitor winner) {
    _competitors.forEach((element) {
      if (element.equals(winner)) {
        element.setWin(winner.isWin());
      }
    });
    notifyListeners();
  }

  void setFileName(String name) {
    _selectedFile = name;
    notifyListeners();
  }


  void setWinnerScale(int scale) {
    _winnerScale = scale;
    notifyListeners();
  }

  void setTitle(String title) {
    _eventTitle = title;
    notifyListeners();
  }

  void setSubTitle(String title) {
    _eventSubTitle = title;
    notifyListeners();
  }

  void setImages(Uint8List image) {
    _giftImages.add(image);
    notifyListeners();
  }

  void removeGifts(int index) {
    _giftImages.removeAt(index);
    notifyListeners();
  }

  List<Uint8List> getGiftIamges() {
    return _giftImages;
  }

  void setCometitors(List<Competitor> list) {
    _competitors = list;
    notifyListeners();
  }

  String selectNewFile(Uint8List bytes, String name) {
    List<Competitor> list = [];
    SpreadsheetDecoder decoder = SpreadsheetDecoder.decodeBytes(bytes);
    Map<String, SpreadsheetTable> sheets = decoder.tables;

    SpreadsheetTable table;
    if (sheets.isNotEmpty) {
      table = sheets[sheets.keys.first];
    } else {
      return "No Sheet Found!";
    }

    table.rows.removeAt(0);

    table.rows.forEach((element) {
      try {
      Competitor competitor = Competitor(name: element[1].toString(), phoneNumber: element[0].toString());

      list.add(competitor);
      } catch(e) {
        print(e);
      }
    });

    setCometitors(list);
    setFileName(name);

    return "Done!";
  }


}