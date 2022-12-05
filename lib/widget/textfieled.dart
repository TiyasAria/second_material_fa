
import 'package:flutter/material.dart';

Widget textfiled({required String hintText, required String label, required IconData icon , required TextInputType keyboardType , IconButton? iconSufix , required bool obsText, required TextEditingController controller}) {
  return TextField(
    controller: controller ,
    keyboardType:keyboardType ,
    obscureText: obsText,
      decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Color(0xffD7CCCC))),
    hintText: hintText,
    hintStyle: TextStyle(color: Color(0xffB1B2BB)),
    prefixIcon: Icon(icon),
    labelText: label,
    fillColor: Color(0xffEFF1F5),
    filled: true,
    suffixIcon: iconSufix,
  ));
}
