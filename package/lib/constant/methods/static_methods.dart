import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:package/package.dart';

class StaticMethods {
  static String formatAmount(num amount) {
    final format = NumberFormat('#,##,###');
    return format.format(amount);
  }

  static String textCapitalize(String input) {
    String text = input.replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]} ${m[2]}');
    return text;
  }

  static convertImageUt8(String imgPath) {
    var uint8 = rootBundle.load(imgPath).then((value) =>
        value.buffer.asUint8List(value.offsetInBytes, value.lengthInBytes));
    return uint8;
  }

  static String currentDate() {
    DateTime dateTime = DateTime.now();

    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return formattedDateTime;
  }

  static String currentTime() {
    DateTime dateTime = DateTime.now();

    String formattedTime = DateFormat('hh:mm:ss a').format(dateTime);
    return formattedTime;
  }

  static DateTime convertDate(String? date) {
    DateTime dateTime;
    'hello'.log;
    if (date == null) return DateTime.now();
    'hello2'.log;
    if (date.isEmpty) return DateTime.now();
    'hello3'.log;
    try {
      dateTime = DateTime.tryParse(date) ?? DateTime.now();
      return dateTime;
    } catch (e) {
      List<String> formats = [
        'hh:mm:ss a',
        'HH:mm:ss',
        'yyyy-MM-dd HH:mm:ss.SSS'
      ];
      for (String format in formats) {
        DateFormat formatter = DateFormat(format);
        dateTime = formatter.tryParse(date) ?? DateTime.now();
        return dateTime;
      }

      throw const FormatException('Invalid time format');
    }
  }

  static String removeCountryCode(String phoneNumber) {
    final countryCodeRegex = RegExp(r'^\+\d+\s');
    return phoneNumber.replaceAll(countryCodeRegex, '');
  }

  /// NumberFormat.simpleCurrency(name: 'USD', decimalDigits: 7)
  /// will format with 7 decimal digits, because that's what we asked for. But
  ///       NumberFormat.simpleCurrency(locale: 'en_US', name: 'JPY')
  /// will format with zero, because that's the default for JPY, and the currency's default takes priority over the locale's default.
  ///       NumberFormat.simpleCurrency(locale: 'en_US')
  static String convertAmountToWord(int amount) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'en_IN');
    String amountInWords = formatter.format(amount);
    return amountInWords;
  }

  static Future<Uint8List> getBytesFromAsset(String path) async {
    ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  static Future<String> convertImageAsBase64(XFile file) async {
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  static String formatDuration(Duration duration) {
    DateFormat format = DateFormat('HH:mm:ss');
    return format.format(DateTime(0).add(duration));
  }

  static Duration parseTime(String input) {
    final parts = input.split(':');

    if (parts.length != 3) throw const FormatException('Invalid time format');

    int days;
    int hours;
    int minutes;
    int seconds;
    int milliseconds;
    int microseconds;

    {
      final p = parts[2].split('.');

      if (p.length != 2) throw const FormatException('Invalid time format');

      final p2 = int.parse(p[1].padRight(6, '0'));
      microseconds = p2 % 1000;
      milliseconds = p2 ~/ 1000;

      seconds = int.parse(p[0]);
    }

    minutes = int.parse(parts[1]);

    {
      int p = int.parse(parts[0]);
      hours = p % 24;
      days = p ~/ 24;
    }

    return Duration(
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        milliseconds: milliseconds,
        microseconds: microseconds);
  }

  static String get convertDateTimeForInvoice {
    final formatter = DateFormat('yyyyMMddHHmmssSSS');
    return formatter.format(DateTime.now());
  }
}
