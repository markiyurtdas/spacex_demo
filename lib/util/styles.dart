import 'package:flutter/cupertino.dart';

class Styles{


  Styles();

  TextStyle normalTextStyle(){
    return TextStyle(fontSize: 16);
  }
  TextStyle headTextStyle({double? fontSize}){
    return TextStyle(fontSize: fontSize == null ? 24: fontSize,fontWeight: FontWeight.bold);
  }
}