import 'package:flutter/material.dart';

const String font_Family = "SF";

const kTempTextStyle = TextStyle(fontFamily: font_Family, fontSize: 27.5);
// fontsize: 100
const kMessageTextStyle = TextStyle(fontFamily: font_Family);
// 60
const kButtonTextStyle = TextStyle(fontFamily: font_Family);
// 30
const kConditionTextStyle = TextStyle(fontSize: 50.0);
// 100
const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide.none));
