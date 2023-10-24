import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    contentPadding:EdgeInsets.fromLTRB(10, 10, 30, 10),
    border: OutlineInputBorder(),
    labelText: label

  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(15),
    backgroundColor: Colors.green,

  );
}
SizedBox Sizebox50(child){
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,

    ),

  );
}