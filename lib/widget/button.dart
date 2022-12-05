import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget button({required BuildContext context, required String title,}) {
  return Container(
    height: 66,
    decoration: BoxDecoration(
        color: Color(0xff1F8AC7), borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
