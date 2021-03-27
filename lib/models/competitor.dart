class Competitor {
  String _name;
  String _phoneNumber;
  bool _win;

  Competitor({String name, String phoneNumber}) : _name = name, _phoneNumber = phoneNumber, _win = false;

  void setWin(bool winState) {
    _win = winState;
  }

  String getName() => this._name;

  String getPhone() {
    if (this._phoneNumber.length > 4) {
      String lastDigits = this._phoneNumber.substring(this._phoneNumber.length - 4, this._phoneNumber.length);
      return "010-****-" + lastDigits;
    } else {
      return "010-****-" + this._phoneNumber;
    }
  }

  bool isWin() => this._win;

  bool equals(Competitor competitor) {
    if (_name == competitor._name && _phoneNumber == competitor._phoneNumber) {
      return true;
    } else {
      return false;
    }
  }
}