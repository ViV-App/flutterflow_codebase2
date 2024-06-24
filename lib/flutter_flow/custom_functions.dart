import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime convertStringToDate(String dateString) {
  final dateFormat = DateFormat('yyyy-MM-dd');

  DateTime date = dateFormat.parse(dateString);

  return date;
}

DateTime convertStringToDateTime(String dateString) {
  final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  DateTime date = dateFormat.parse(dateString);

  // Create a new DateTime object without seconds and milliseconds
  DateTime finalDate = DateTime(
    date.year,
    date.month,
    date.day,
    date.hour,
    date.minute,
  );

  return finalDate;
}

DateTime combineDateAndTime(
  String date01,
  String date02,
) {
  // Define the date formats for parsing the input strings
  final dateFormatWithMillis = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final isoDateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  // Parse date01 (with milliseconds)
  DateTime parsedDate01 = dateFormatWithMillis.parse(date01);

  // Parse date02 (ISO 8601 format)
  DateTime parsedDate02 = isoDateFormat.parse(date02);

  // Combine the date from date01 with the time from date02
  DateTime combinedDate = DateTime(
      parsedDate01.year,
      parsedDate01.month,
      parsedDate01.day,
      parsedDate02.hour,
      parsedDate02.minute,
      parsedDate02.second);

  return combinedDate;
}

DateTime getFinalDate(
  DateTime date,
  int days,
) {
  return date.add(Duration(days: days));
}

List<DateTime> getWeekCalendar(DateTime date) {
  // Ajusta a semana para começar no domingo e terminar no sábado
  // Se você quer que a semana comece na segunda, ajuste para: date.weekday - 1
  int startOffset =
      date.weekday % 7; // Domingo = 0, Segunda = 1, ..., Sábado = 6
  DateTime startOfWeek = date.subtract(Duration(days: startOffset));

  List<DateTime> weekDates = [];
  for (int i = 0; i < 7; i++) {
    weekDates.add(startOfWeek.add(Duration(days: i)));
  }

  return weekDates;
}

DateTime addDaysToDate(
  DateTime date,
  int days,
) {
  DateTime newDate = date.add(Duration(days: days));

  return newDate;
}

List<String> generateWeek(DateTime initialDate) {
  List<String> week = [];
  List<String> daysOfWeek = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

  for (int i = 0; i < 7; i++) {
    DateTime currentDate = initialDate.add(Duration(days: i));
    String dayWithLetter =
        '${currentDate.day}${daysOfWeek[currentDate.weekday % 7]}';
    week.add(dayWithLetter);
  }

  return week;
}

List<int> generateNumberList() {
  List<int> numberList = List.generate(150, (index) => index + 1);
  return numberList;
}

DateTime subDaysToDate(
  DateTime date,
  int days,
) {
  DateTime newDate = date.subtract(Duration(days: days));

  return newDate;
}
