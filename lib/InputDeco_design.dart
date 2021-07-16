import 'package:flutter/material.dart';

  InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.black),
    prefixIcon: Icon(icons,color: Colors.black),
    errorStyle: TextStyle(color: Colors.amberAccent),

    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
          color: Colors.green,
          width: 2.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 2.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.yellowAccent,
        width: 2.5,
      ),
    ),
  );
}