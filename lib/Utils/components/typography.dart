import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:activos/Utils/components/color.dart';

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 26,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 20, color: textPrimary, fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(fontSize: 12, color: textPrimary, letterSpacing: 1));

TextStyle listTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(fontSize: 12, color: textPrimary, letterSpacing: 1));

TextStyle listTittleTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(fontSize: 12, color: textSecondary2, letterSpacing: 1));

// Advanced
// TODO: Add additional text styles.
