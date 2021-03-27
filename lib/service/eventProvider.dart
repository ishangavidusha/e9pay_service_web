import 'dart:typed_data';
import 'package:e9pay_service/models/competitor.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class EventProvider with ChangeNotifier {
  List<Competitor> _competitors = [];
  List<Competitor> _winners = [];
  int _winnerScale = 3;
  List<Uint8List> _giftImages = [];
  String _eventTitle = "E9pay Remittance";
  String _eventSubTitle = "E9pay Overseas Remittance Service";
  String _selectedFile = "File Not Selected!";
  int _shuffleRounds = 30;
  int _imageAutoPlayInterval = 2;

  String getTitle() => _eventTitle;
  String getSubTitle() => _eventSubTitle;
  List<Competitor> getCompetitors() => _competitors;
  List<Competitor> getWinners(){
    return _winners;
  }
  int getCompetitorsSize() {
    return _competitors.length;
  }
  int getWinnerScale() => _winnerScale;

  String getFileName() {
    print(_selectedFile);
    return _selectedFile;
  }

  int getAutoPlayInterval() {
    return _imageAutoPlayInterval;
  }

  int getShuffleRounds() {
    return _shuffleRounds;
  }

  void setAutoPlayInterval(int value) {
    _imageAutoPlayInterval = value;
    notifyListeners();
  }

  void setShuffleRounds(int value) {
    _shuffleRounds = value;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  void setTempWinners(List<Competitor> temp) {
    _winners = temp;
    notifyListeners();
  }

  void updateWinners(Competitor winner, int index) {
    _winners[index] = winner;
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