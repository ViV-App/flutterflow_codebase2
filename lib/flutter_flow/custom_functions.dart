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
import '/backend/schema/enums/enums.dart';
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

String replacePlaceholders(
  String text,
  String replacement,
) {
  return text.replaceAll(RegExp(r'{{\s*nome_paciente\s*}}'), replacement);
}

List<dynamic> getCountryDetails() {
  const List<Map<String, dynamic>> countries = [
    {
      "countryName": "Brasil",
      "countryCode": "BR",
      "dialCode": "+55",
      "flag": "https://flagcdn.com/h80/br.png"
    },
    {
      "countryName": "Estados Unidos",
      "countryCode": "US",
      "dialCode": "+1",
      "flag": "https://flagcdn.com/h80/us.png"
    },
    {
      "countryName": "Canadá",
      "countryCode": "CA",
      "dialCode": "+1",
      "flag": "https://flagcdn.com/h80/ca.png"
    },
    {
      "countryName": "Alemanha",
      "countryCode": "DE",
      "dialCode": "+49",
      "flag": "https://flagcdn.com/h80/de.png"
    },
    {
      "countryName": "França",
      "countryCode": "FR",
      "dialCode": "+33",
      "flag": "https://flagcdn.com/h80/fr.png"
    },
    {
      "countryName": "Itália",
      "countryCode": "IT",
      "dialCode": "+39",
      "flag": "https://flagcdn.com/h80/it.png"
    },
    {
      "countryName": "Espanha",
      "countryCode": "ES",
      "dialCode": "+34",
      "flag": "https://flagcdn.com/h80/es.png"
    },
    {
      "countryName": "Portugal",
      "countryCode": "PT",
      "dialCode": "+351",
      "flag": "https://flagcdn.com/h80/pt.png"
    },
    {
      "countryName": "Argentina",
      "countryCode": "AR",
      "dialCode": "+54",
      "flag": "https://flagcdn.com/h80/ar.png"
    },
    {
      "countryName": "Chile",
      "countryCode": "CL",
      "dialCode": "+56",
      "flag": "https://flagcdn.com/h80/cl.png"
    },
    {
      "countryName": "Colômbia",
      "countryCode": "CO",
      "dialCode": "+57",
      "flag": "https://flagcdn.com/h80/co.png"
    },
    // Adicione outros países conforme necessário
  ];

  return countries;
}

String concatenString(
  String str1,
  String str2,
) {
  return str1 + str2;
}

List<String> brazilUfs() {
  List<String> ufCodes = [
    "AC", // Acre
    "AL", // Alagoas
    "AP", // Amapá
    "AM", // Amazonas
    "BA", // Bahia
    "CE", // Ceará
    "DF", // Distrito Federal
    "ES", // Espírito Santo
    "GO", // Goiás
    "MA", // Maranhão
    "MT", // Mato Grosso
    "MS", // Mato Grosso do Sul
    "MG", // Minas Gerais
    "PA", // Pará
    "PB", // Paraíba
    "PR", // Paraná
    "PE", // Pernambuco
    "PI", // Piauí
    "RJ", // Rio de Janeiro
    "RN", // Rio Grande do Norte
    "RS", // Rio Grande do Sul
    "RO", // Rondônia
    "RR", // Roraima
    "SC", // Santa Catarina
    "SP", // São Paulo
    "SE", // Sergipe
    "TO" // Tocantins
  ];

  return ufCodes;
}

List<String> removeItemAtString(
  List<String> list,
  String value,
) {
  list.remove(value);

  return list;
}

List<String> addItemToList(
  List<String> list,
  String response,
) {
  list.add(response);
  return list;
}

List<String> removeItemAtIndex(
  List<String> list,
  int index,
) {
  if (index >= 0 && index < list.length) {
    list.removeAt(index);
  }
  return list;
}

double divideAndNormalize(
  int numerator,
  int denominator,
) {
  double result = numerator / denominator;
  if (result > 1.0) {
    result = 1.0;
  } else if (result < 0.0) {
    result = 0.0;
  }
  return double.parse(result.toStringAsFixed(2));
}

String concatenString2(
  String str1,
  String str2,
) {
  return str1 + " - " + str2;
}

List<dynamic> inferirPesos(List<String> strings) {
  List<dynamic> resultado = [];
  int count = strings.length;
  if (count == 1) {
    resultado.add({"string": strings[0], "peso": 1});
  } else if (count == 2) {
    resultado.add({'string': strings[0], 'peso': 0.75});
    resultado.add({'string': strings[1], 'peso': 0.25});
  } else if (count == 3) {
    resultado.add({'string': strings[0], 'peso': 0.50});
    resultado.add({'string': strings[1], 'peso': 0.25});
    resultado.add({'string': strings[2], 'peso': 0.25});
  }

  return resultado;
}

dynamic stringToJson(String string) {
  return jsonDecode(string);
}

DateTime addMonthsToDate(
  DateTime date,
  int months,
) {
  // add months to a date
  int year = date.year;
  int month = date.month + months;
  while (month > 12) {
    year++;
    month -= 12;
  }
  return DateTime(year, month, date.day, date.hour, date.minute, date.second,
      date.millisecond, date.microsecond);
}

int getMonthNumber(DateTime date) {
  // extract month number of a date
  int month = date.month;
  return month;
}
