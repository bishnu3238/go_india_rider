import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/size_utils.dart';
import 'colors.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

const FontWeight fwb = FontWeight.bold;
const FontWeight fw2 = FontWeight.w200;
const FontWeight fw3 = FontWeight.w300;
const FontWeight fw5 = FontWeight.w500;
const FontWeight fw6 = FontWeight.w600;
const FontWeight fw7 = FontWeight.w700;
const FontWeight fw9 = FontWeight.w900;

const String familyInter = "Inter";
const String familyRaleWay = "Raleway";
const String familyUrbanist = "Urbanist";
const String familySFPro = "SF Pro Display";
const String familyPlusJakarta = "Plus Jakarta";
const String familyGrandisExtends = "Grandis Extended";

class StyleX {

  /// [Shadow] Style;
  static TextStyle shadow(context) => TextStyle(
        color: Theme.of(context).colorScheme.outline,
        package: 'package',
      );
  static TextStyle shadowFont(context) => TextStyle(
        color: Theme.of(context).colorScheme.outline,
        fontFamily: familyInter,
        package: 'package',
        fontWeight: fw6,
      );
  static TextStyle shadowBold(context) => TextStyle(
        fontWeight: fwb,
        color: Theme.of(context).colorScheme.outline,
        fontSize: getFontSize(16),
        package: 'package',
      );

  static TextStyle background(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        package: 'package',
      );

  static TextStyle bgUrban(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: familyUrbanist,
        package: 'package',
      );
  static TextStyle get grey => TextStyle(
        color: kGrey,
        package: 'package',
      );
  static TextStyle greyInter(context) => TextStyle(
        color: kGrey,
        fontFamily: familyInter,
        package: 'package',
      );
  static TextStyle redInter(context) => TextStyle(
        color: kError,
        fontFamily: familySFPro,
        package: 'package',
      );

  static TextStyle tertiary(context) => TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
      );
  static TextStyle tertiaryUrban(context) => TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontFamily: familyUrbanist,
        package: 'package',
        fontWeight: fw7,
      );

  // Body text style
  static TextStyle bodyLarge(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: getFontSize(20),
        fontFamily: familySFPro,
        package: 'package',
        fontWeight: fw6,
      );
  static TextStyle bodyPrimary(context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
      );
  static TextStyle bodyBoldPlus(context) => TextStyle(
        fontWeight: fwb,
        fontSize: getFontSize(15),
        fontFamily: familyPlusJakarta,
        color: Theme.of(context).colorScheme.primary,
        overflow: TextOverflow.ellipsis,
        package: 'package',
      );
  static TextStyle bodyOnPrimary(context) => TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      );
  static TextStyle get bodyMedium => TextStyle(
        fontSize: getFontSize(12),
      );
  static TextStyle bodyMediumInter(context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: getFontSize(12),
        fontFamily: familyInter,
        package: 'package',
      );
  static TextStyle get bodySmall => TextStyle(
        fontSize: getFontSize(10),
      );

  static TextStyle get lineCut => TextStyle(
        decoration: TextDecoration.lineThrough,
      );
  static TextStyle get underline => TextStyle(
        decoration: TextDecoration.underline,
      );

  /// Title text style

  static TextStyle titleLarge(context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontFamily: familyGrandisExtends,
        package: 'package',
      );
  static TextStyle titleMedium(context) => TextStyle(
        fontWeight: fw6,
        fontSize: getFontSize(15),
        fontFamily: familyGrandisExtends,
        package: 'package',
      );
  static TextStyle titleSmall(context) => TextStyle(
        fontSize: getFontSize(12),
        fontFamily: familyGrandisExtends,
        package: 'package',
      );

  static TextStyle titleLargeBold(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontWeight: fwb,
        fontSize: getFontSize(15),
        fontFamily: familyGrandisExtends,
        package: 'package',
      );

  /// urbanist
  static TextStyle urbanist(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: getFontSize(30),
        fontFamily: familyUrbanist,
        package: 'package',
      );
  static TextStyle urbanistSmall(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: getFontSize(13),
        fontFamily: familyUrbanist,
        package: 'package',
      );
  static TextStyle urbanistSemiBold(context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: "Urbanist-SemiBold",
        fontWeight: FontWeight.bold,
        fontSize: getFontSize(15),
        package: 'package',
      );
  static TextStyle urbanistMedium(context) => TextStyle(
        fontFamily: familyUrbanist,
        color: Color(0xFF8391A1),
        package: 'package',
        fontSize: 15,
      );

  /// plus jakarta
  static TextStyle plus(context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontFamily: familyPlusJakarta,
        fontSize: getFontSize(15),
        package: 'package',
        fontWeight: fwb,
      );

  ///
  static TextStyle quando(context) => GoogleFonts.quando(
        color: Theme.of(context).colorScheme.primary,
      );

  static TextStyle gideonRoman(context) => GoogleFonts.gideonRoman(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: fw6,
      );

  /// inter
  static TextStyle inter(context) => GoogleFonts.inter(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: fw7,
      );

  /// roboto
  static TextStyle roboto(context) => GoogleFonts.roboto(
        color: Theme.of(context).colorScheme.primary,
        fontSize: getFontSize(15),
        fontWeight: fw6,
      );

  /// gentium plus
  static TextStyle gentiumPlus(context) => GoogleFonts.gentiumPlus(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: fw6,
        letterSpacing: 0.0,
      );
  static TextStyle gentiumPlusBold(context) => GoogleFonts.gentiumPlus(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: fwb,
        letterSpacing: 0.0,
      );

  /// grand bold
  static TextStyle grandBold(context) => GoogleFonts.grandHotel(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: fwb,
      );
}
