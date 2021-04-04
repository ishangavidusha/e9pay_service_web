import 'package:e9pay_service/utils/appData.dart';
import 'package:flutter/material.dart';



class KText extends StatelessWidget {
  final AppData appData = AppData();
  final String text;
  final double size;
  final bool bold;

  KText({Key key, this.text, this.size, this.bold}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double devWidth = 1200;
    return Text(
      text,
      style: appData.getMainTextStyle().copyWith(
        fontSize: devWidth > 1200 ? 1200 * size : devWidth * size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}


class KFText extends StatelessWidget {
  final AppData appData = AppData();
  final String text;
  final double size;
  final bool bold;
  final bool si;
  final TextAlign textAlign;

  KFText({Key key, this.text, this.size, this.bold, this.si = false, this.textAlign = TextAlign.start}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      maxLines: 2,
      textAlign: textAlign,
      style: si ? appData.getMainTextStyle().copyWith(
        fontSize: devWidth > 1200 ? 1200 * size : devWidth * size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "FMBindumathi",
      ) : appData.getMainTextStyle().copyWith(
        fontSize: devWidth > 1200 ? 1200 * size : devWidth * size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}