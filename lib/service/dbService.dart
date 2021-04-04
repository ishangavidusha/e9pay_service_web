

// google auth credentials
import 'package:e9pay_service/models/userData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "e9pass-cs",
  "private_key_id": "11e14f17641b628c3903e078c5da751cf805e450",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDzVg1hfDItsLkL\nP00G5y68xZJWj6bxg5OVL1YB1UHa2HCF8zpLB329vPMBiK9CTy1lWT2/OmkftakS\n8krvOUaQBDXLwF8rtzp7Gcbf9M1nLprVfJvIrNEfhKyA4+Uvgzbk6lDXG8ybj869\nTgE9iCc/0CDTb4T28RFi+Za0TGfoM2C/kjPrkod4GY9Q58DijLJ9IjuwdrV69omj\nIKasanmKM13I1TMcDLI2bpz/8dGapWlhpCTuTTiMjSjh672kuDIv6l2OoT/QbVaY\nE5TADySALwicJWZj8//muCvfQseMTboWsMXT/J1bjJLnxpmkqaETSR16AamDLJao\nHDo3QYmBAgMBAAECggEAFqvbz0tc+XjPpMafDJeZeSkHO11i9nmF1I52evE9k4A6\n65//vGHUS0tBcNElUw5BcoHgCOMOTFAGkqdUZ/l0I5Lg2DzyIQaPQkzihJcwU/65\nmk5jzUycp00bLV8OSWD2Slmycng6lfvODUEpSGxZC87+X/Sx9Lf9ILWUXvQHclC4\nmxpp12Q+lXJGJDWG7Krd7NOf5KdL2HoJj6yucau99Yk4jaao/993eDIGB+rHb1s2\n/ThgHUw8t799sY5E/TMp8FHIrXYfdPyQ5MpkjR+hRcrVHrIJeuco9Idv2QPBktTj\nBcQKEQj7PGNtMWpsgX3IlnyWr8FuP1N1bftc/xzaiQKBgQD/2heB1KgdIYvTrac5\nlfPjIWJB3Ej2KN77VtzcHPXvrVhLFCiHupJK6q6us1xYridGACsapVeW1T9aboj1\nbZ7XiUY/gi0wysY5mQuC+EPwUXVB14Hg/IUUnVwP+hPSkcqXjeMvLQmVqO7ZnRzO\nqHH7hF9eIXJc9rDGwlD7ZBJ5swKBgQDzehsmEJ+JYFQPYrMwwX7KggFZqPHwophE\nWkIGf+9QM+2vOIXRmEw6iHrTze74NJQCUykoO90lcrRMBF4QRCxss2Xw98rOk8fn\nhpDxhIlygjzh9Lik+hBBlVAvqlYB3fu4Wbe1zM51kfhNK9Jha08fN1KDYJrJX2I0\noJU0J+Ft+wKBgF2twQWsk5F3AveSkbQoD5COXKe4vI5FEL/+YgfGItaLJdT3oI9x\n5LbBjwwwaBOgUIj07tNmztdPZU77QfJ7HLnWbX47b8h5tnLIcsqVlGqdqM1e1xNF\n4oRVyauf6TokX4V2UkSnvOarYCkVucKBMprhMPoKTRF00e00oOorDgi5AoGAbXsB\njCs7YY10Hvr1sj2/opW0v7lNGTQzncCsIboTRRAkl36mBaoi1Msb1/OouekCiM0W\nG6ZXeYhLdEceeNf+1d4RP7pccmlXIU+MC13aZCgV8lCVWnGrL6JRTS2dwPctQibt\niY0PZSR+70x+LBoRmOrKapLc5yHBygJPNQWdw1MCgYEA9VBmkUYhZHsSfcnX2wTX\ngLZHTvT4hNrGpZ8rOnlSOAof9ve5UPVSiG0ajDafKYKa4n8VVu7N8bALpfh4qgb6\nR5vWDogBHPUaxMrRC1Ir8cJLDSUpEG5NaZb1T22fihIYkhUzqWFRT8nw7cLJN5OE\n86lv/sd9b4tsXVDIlB/aFWY=\n-----END PRIVATE KEY-----\n",
  "client_email": "ishanga@e9pass-cs.iam.gserviceaccount.com",
  "client_id": "105134107086535559312",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ishanga%40e9pass-cs.iam.gserviceaccount.com"
}
''';

class SheetService with ChangeNotifier {
  GSheets gsheets = GSheets(_credentials);
  String sheetId = kReleaseMode ? "1jN14vQxlXJEhs7WEsH5m3bnpkppJVokVMf3GSeFy3_g" : "1IrN7-R34kgnWUY0uD3OPFvBCb4CvinprrCPzW_eHvU8";
  String dataSheetId = "1hzcjzUUryHTVklHHd-dn-b85zmEr1qu1ZZbkP8cVPZw";
  Spreadsheet spreadsheet;
  Spreadsheet pdfDataspreadsheet;
  UserData _userData = UserData(
    id: "",
    name: "",
    phoneNumber: "",
  );
  bool _loading = false;
  String _labuUrl = "";
  String _eleUrl = "";

  Future<bool> loginOrRegister(String name, String phoneNumber) async {

    try {
      setLoading(true);
      spreadsheet = await gsheets.spreadsheet(sheetId);
      Worksheet worksheet = spreadsheet.worksheetByIndex(0);
      List data = await worksheet.values.allRows();

      data.removeAt(0);
      int found = 0;

      if (data.isNotEmpty) {
        found = data.indexWhere((element) => element[2].toString().compareTo(phoneNumber) == 0);
      } else {
        found = -1;
      }


      if (found != -1) {

        _userData.id = data[found][0].toString();
        _userData.name = data[found][1].toString();
        _userData.phoneNumber = data[found][2].toString();
        _userData.diceGame = data[found][3] == "FALSE" ? false : true;
        _userData.diceStatus = data[found][4] == "FALSE" ? false : true;
        _userData.diceValue = int.parse(data[found][5]);
        _userData.potGame = data[found][6] == "FALSE" ? false : true;
        _userData.potStatus = data[found][7] == "FALSE" ? false : true;
        _userData.potValue = int.parse(data[found][8]);
        _userData.eleGame = data[found][9] == "FALSE" ? false : true;
        _userData.eleStatus = data[found][10].toString();
        _userData.labuGame = data[found][11] == "FALSE" ? false : true;
        _userData.labuStatus = data[found][12].toString();

        notifyListeners();
      } else {

        String newId = DateTime.now().microsecondsSinceEpoch.toString();

        bool registerResult = await worksheet.values.appendRow([newId, name, phoneNumber, "FALSE", "FALSE", 0, "FALSE", "FALSE", 0, "FALSE", "null", "FALSE", "null"]);

        if (registerResult) {
          _userData.id = newId;
          _userData.name = name;
          _userData.phoneNumber = phoneNumber;
          _userData.diceGame = false;
          _userData.diceStatus = false;
          _userData.diceValue = 0;
          _userData.potGame = false;
          _userData.potStatus = false;
          _userData.potValue = 0;
          _userData.eleGame = false;
          _userData.eleStatus = "null";
          _userData.labuGame = false;
          _userData.labuStatus = "null";
        } else {
          return false;
        }


        notifyListeners();
      }

      setLoading(false);
      return true;

    } catch (e) {
      print(e);
      setLoading(false);
      return false;
    }

  }

  String getLabuURL() {
    return _labuUrl.isNotEmpty ? _labuUrl : "https://i.ibb.co/z8R5Ryf/Screenshot-2018-12-16-at-21-06-29.png";
  }

  String getEleURL() {
    return _eleUrl.isNotEmpty ? _eleUrl : "https://i.ibb.co/z8R5Ryf/Screenshot-2018-12-16-at-21-06-29.png";
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool getLoading() {
    return _loading;
  }

  String getName() {
    return _userData.name;
  }

  String getPhone() {
    return _userData.phoneNumber;
  }

  bool isLogin() {
    if (_userData.phoneNumber != null && _userData.phoneNumber.length > 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isDicePlayed() {
    return _userData.diceGame;
  }

  bool isDiceWin() {
    return _userData.diceStatus;
  }

  Future<bool> setDiceValue(int value) async {
    _userData.diceValue = value;
    bool result = await updateUser();
    notifyListeners();
    return result;
  }

  bool isPotPlayed() {
    return _userData.potGame;
  }

  bool isPotWin() {
    return _userData.potStatus;
  }

  Future<bool> setPotValue(int value) async {
    _userData.potValue = value;
    bool result = await updateUser();
    notifyListeners();
    return result;
  }

  bool isElePlayed() {
    return _userData.eleGame;
  }

  List<String> getEleValue() {
    String value = _userData.eleStatus.replaceAll("[", "").replaceAll("]", "");
    if (value.split(",").length == 3) {
      return value.split(",");
    }
    return null;
  }

  Future<bool> setEleValue(String value) async {
    _userData.eleStatus = value;
    _userData.eleGame = true;
    bool result = await updateUser();
    notifyListeners();
    return result;
  }

  bool isLabuPlayed() {
    return _userData.labuGame;
  }

  List<String> getLabuValue() {
    String value = _userData.labuStatus.replaceAll("[", "").replaceAll("]", "");
    if (value.split(",").length == 3) {
      return value.split(",");
    }
    return null;
  }

  Future<bool> setLabuValue(String value) async {
    _userData.labuStatus = value;
    _userData.labuGame = true;
    bool result = await updateUser();
    notifyListeners();
    return result;
  }

  Future<bool> updateUser() async {
    try {
      setLoading(true);
      spreadsheet = null;
      spreadsheet = await gsheets.spreadsheet(sheetId);
      Worksheet worksheet = spreadsheet.worksheetByIndex(0);
      List data = await worksheet.values.allRows();

      data.removeAt(0);
      int found = 0;

      if (data.isNotEmpty) {
        found = data.indexWhere((element) => element[0].toString().compareTo(_userData.id) == 0);
      } else {
        found = -1;
      }

      if (found != -1) {

        bool result = await worksheet.values.insertRow(found + 2, [
          _userData.id,
          _userData.name,
          _userData.phoneNumber,
          _userData.diceGame ? "TRUE" : "FALSE",
          _userData.diceStatus ? "TRUE" : "FALSE",
          _userData.diceValue.toString(),
          _userData.potGame ? "TRUE" : "FALSE",
          _userData.potStatus ? "TRUE" : "FALSE",
          _userData.potValue.toString(),
          _userData.eleGame ? "TRUE" : "FALSE",
          _userData.eleStatus,
          _userData.labuGame ? "TRUE" : "FALSE",
          _userData.labuStatus,
        ]);

        if (!result) {
          _userData.phoneNumber = null;
        }

        setLoading(false);
        return result;

      } else {
        setLoading(false);
        return false;
      }
    } catch (e) {
      print(e);
      _userData.phoneNumber = null;
      setLoading(false);
      return false;
    }
  }

  Future<bool> getAppData() async {
    try {
      spreadsheet = null;
      spreadsheet = await gsheets.spreadsheet(dataSheetId);
      Worksheet worksheet = spreadsheet.worksheetByIndex(0);
      List data = await worksheet.values.allRows();

      if (data.isNotEmpty) {
        _labuUrl = data[0][1].toString();
        _eleUrl = data[1][1].toString();
      }
      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }


}