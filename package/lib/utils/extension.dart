import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ObjectX on Object? {
  get log => dev.log(toString());
  String? get toStr => this == null ? null : toString();
  List<String> get toArray => this == null
      ? []
      : (this is List
          ? [...toString().substring(1, toString().length - 1).split(", ")]
          : [toString()]);
  bool get toBull => this == null
      ? false
      : toStr!.contains('true')
          ? true
          : false;
  bool get toIntoBull {
    switch (this) {
      case null:
        return false;
      case '':
        return false;
      case '1':
        return true;
      default:
        return false;
    }
  }
}

extension NumX on num {
  get log => dev.log(toString());

  Duration get milli => Duration(milliseconds: toInt());
  Duration get sec => Duration(milliseconds: toInt() * 1000);

  Radius get radius => Radius.circular(toDouble());
  BorderRadius get borderRadius => BorderRadius.all(radius);
  RoundedRectangleBorder get roundRectangleBorder =>
      RoundedRectangleBorder(borderRadius: borderRadius);

  EdgeInsets get px => EdgeInsets.all(toDouble());
  EdgeInsets get mx => EdgeInsets.all(toDouble());
  EdgeInsets get pxTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get pxLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get pxRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get pxBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get pxH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get pxV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get pxHV =>
      EdgeInsets.symmetric(horizontal: toDouble(), vertical: toDouble() / 2);
  EdgeInsets get pxVH =>
      EdgeInsets.symmetric(horizontal: toDouble() / 2, vertical: toDouble());
  EdgeInsets get pxSy {
    final parts = this.toString().split('.');
    double horizontal = double.parse(parts[0]);
    double vertical = parts.length > 1 ? double.parse(parts[1]) : 0;
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  get media => MediaQuery.of(this);
  get size => MediaQuery.of(this).size;
}

extension StringX on String {
  int get toint => isEmpty ? 0 : int.tryParse(replaceAll(",", "")) ?? 0;
  double get toDbl =>
      isEmpty ? 0.0 : double.tryParse(replaceAll(",", "")) ?? 0.0;

  DateTime get toDateTime {
    if (isEmpty) return DateTime.now();
    try {
      return DateTime.parse(this);
    } on FormatException {
      final dateFormats = [
        DateFormat('yyyy-MM-dd'),
        DateFormat('yyyy-MM-dd HH:mm'),
        DateFormat('yyyy-MM-dd HH:mm:ss'),
      ];

      for (final format in dateFormats) {
        try {
          return format.parse(this);
        } catch (e) {
          continue;
        }
      }

      return DateTime.now();
    }
  }

  DateTime get toDMY {
    DateTime dateTime =
        DateFormat("yyyy-MM-dd").parse(toString().replaceAll(" ", "").trim());
    String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);
    DateTime date = DateFormat("dd-MM-yyyy").parse(formattedDate);
    return date;
  }

  String get removeCountryCode {
    String digitsOnly = replaceAll(RegExp(r'\D'), '');

    if (length == 10) return this;

    if (digitsOnly.startsWith('91')) {
      return digitsOnly.substring(2);
    }

    return digitsOnly;
  }

  DateTime? toDateObject() {
    String trimmed = this.trim();

    for (final format in ['yyyy-MM-dd', 'dd-MM-yyyy', 'MM-dd-yyyy']) {
      try {
        return DateFormat(format).parse(trimmed);
      } catch (e) {
        'DateFormat Error : $e'.log;
        // Ignore and try other formats
      }
    }

    RegExp monthNameRegex = RegExp(
        r"^(?<month>\w{3}) (?<day>\d{1,2}), (?<year>\d{4})$",
        caseSensitive: false);
    Match? monthNameMatch = monthNameRegex.firstMatch(trimmed);
    if (monthNameMatch != null) {
      Map<String, String> monthNames = {
        "jan": "1",
        "feb": "2",
        "mar": "3",
        "apr": "4",
        "may": "5",
        "jun": "6",
        "jul": "7",
        "aug": "8",
        "sep": "9",
        "oct": "10",
        "nov": "11",
        "dec": "12"
      };
      int monthNum =
          int.parse(monthNames[monthNameMatch.group(1)!.toLowerCase()]!);
      return DateTime(int.parse(monthNameMatch.group(3)!), monthNum,
          int.parse(monthNameMatch.group(2)!));
    }

    RegExp twoDigitYearRegex =
        RegExp(r"^(?<month>\d{1,2})/(?<day>\d{1,2})/(?<year>\d{2})$");
    Match? twoDigitYearMatch = twoDigitYearRegex.firstMatch(trimmed);
    if (twoDigitYearMatch != null) {
      int year = int.parse(twoDigitYearMatch.group(3)!);
      if (year < 50) {
        year += 2000;
      } else {
        year += 1900;
      }
      return DateTime(year, int.parse(twoDigitYearMatch.group(1)!),
          int.parse(twoDigitYearMatch.group(2)!));
    }

    return null;
  }

  TimeOfDay? get toTime {
    if (this.isEmpty) return null;

    try {
      return TimeOfDay.fromDateTime(DateTime.parse(this));
    } on FormatException {
      try {
        return TimeOfDay.fromDateTime(DateTime.parse(this));
      } catch (e) {
        return null;
      }
    }
  }

  ThemeMode get theme {
    return ThemeMode.values.firstWhere((element) => element.name == this,
        orElse: () => ThemeMode.system);
  }

  ///
  ///  capitalize first letter;
  ///  convert "example" to "Example"
  String get toCFirstLetter {
    if (this.isEmpty) return this;
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension DoubleX on double {
  get log => dev.log(toString());
  String get noFraction => toStringAsFixed(0);
}

extension DateTimeX on DateTime {
  String get toDMY => DateFormat('dd MMM yyyy').format(this);
}
