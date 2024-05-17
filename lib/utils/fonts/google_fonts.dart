import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsStyle{
  static final TextStyle kZillaSlabFont = GoogleFonts.zillaSlab(
    textStyle:const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  ); static final TextStyle poppinsFont = GoogleFonts.poppins(
    textStyle:const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  );
}