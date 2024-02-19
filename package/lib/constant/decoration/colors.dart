import 'package:flutter/material.dart';

/// Grey Color;
const Color kGrey = Color(0xFFb4bdce);
const Color kGrey2 = Color(0xFF979797);
const Color kGreyDeep = Color(0xFF757575);
const Color kGreyLight = Color(0xFFcaced4);

/// Red Colors;
const Color kRed = Color(0xFFE74C3C);
const Color kR400 = Color(0xFFF51B45);
const Color kError = Color(0xFFFA1616);
const Color kRedColor = Color(0xFFE92E30);

/// Green Colors;
const Color kGreen = Color(0xFF048D14);
const Color kGreen2 = Color(0xFF11DC09);
const Color kGreen3 = Color(0xFF32CD32);
const Color kGreenLime = Color(0xff7fff00);
const Color kGreenLight = Color(0xFF6AC259);

/// White colors;
const Color kWhite = Color(0xFFFFFFFF);
const Color kWhite2 = Color(0xFFF5F6F9);
const Color kWhite3 = Color(0xFFf2f6ff);
const Color kWhiteSoft = Color(0xfff1efef);

/// Pink Colors;
const kPink = Color(0xFFFC06D3);

/// Blue Colors;
const Color kBlue = Color(0xFF2874F0);
const Color kBlueDeep = Color(0xFF061857);
const Color kBlueLight = Color(0xFF6584f7);
const Color KBlueFacebook = Color(0xFF1877f2);

/// Orange Colors;
const Color kOrange = Color(0xFFFF7643);
const Color KOrange2 = Color(0xFFff6348);
const Color kOrangeLight = Color(0xFFFE9879);

/// Dark Colors;
const kDark = Color(0xFF010A17);
const kDarkDeep = Color(0xFF010423);

/// Violet Colors;
const kViolet = Color(0xFF47143D);

/// Yellow Colors;
const Color kYellow = Color(0xFFffa302);
const Color kYellow2 = Color(0xFFFFD684);
const Color kYellowSoft = Color(0xFFB9974F);

const Color googleColor = Color(0xFF346EF1);
const Color appleColor = Color(0xFF000000);
const Color microsoftColor = Color(0xFF2F2F2F);
const Color facebookColor = Color(0xFF1877F2);
const Color redditColor = Color(0xFFFF4500);
const Color twitterColor = Color(0xFF1D9BF0);
const Color linkedinColor = Color(0xFF0A66C2);
const Color githubColor = Color(0xFF191717);
const Color mediumColor = Color(0xFF000000);
const Color dribbbleColor = Color(0xFFEA4C89);
const Color spotifyColor = Color(0xFF1ED760);
const Color pinterestColor = Color(0xFFBD081C);

/// Gradient Colors;
LinearGradient kLinearGradient({required List<Color> colors}) => LinearGradient(
      colors: colors,
      stops: [0.0, 1.0],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
