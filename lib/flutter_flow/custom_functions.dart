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

List<dynamic> dataTypeListToJsonList(List<HorariosStruct> dataList) {
  return dataList.map((item) => jsonEncode(item.toMap())).toList();
}

List<dynamic> convertHorarioToJson(List<HorariosStruct> horarios) {
  final List<Map<String, dynamic>> jsonList = horarios.map((horario) {
    return {
      'horario': horario.horario
          .toString()
          .substring(0, 19), // Converte DateTime para String
      'dosagem': horario.dosagem,
      'medida': horario.medida,
    };
  }).toList();
  return jsonList;
}

List<DateTime> convertStringsToDateTimes(List<String> dateStrings) {
  final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  // Mapear cada string na lista para um DateTime
  List<DateTime> dateTimes = dateStrings.map((dateString) {
    DateTime date = dateFormat.parse(dateString);

    // Criar um novo objeto DateTime sem segundos e milissegundos
    DateTime finalDate = DateTime(
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
    );

    return finalDate;
  }).toList();

  return dateTimes;
}

List<double> convertIntegersToDoubles(List<int> integers) {
  // Mapear cada inteiro para um double
  List<double> doubles = integers.map((int value) {
    return value.toDouble(); // Converte o inteiro em double
  }).toList();

  return doubles;
}

List<int> listOfHours() {
  // return a list of numbers from 0 to 24
  return List<int>.generate(24, (index) => index);
}

List<int> listOfMinutes() {
  // return a list of numbers from 0 to 59
  return List<int>.generate(60, (index) => index);
}

int getCurrentHour(DateTime date) {
  // extract month number of a date
  int hour = date.hour;
  return hour;
}

int getCurrentMin(DateTime date) {
  int min = date.minute;
  return min;
}

List<int> yearsList() {
  // generate a list of years from 1950 to 2050
  List<int> years = List.generate(101, (index) => 1950 + index);
  return years;
}

List<int> returnMonths() {
  // return a list of numbers from 1 to 12
  return List<int>.generate(12, (index) => index + 1);
}

List<int> diasNoMes(
  int mes,
  int ano,
) {
  int diasNoMes = 0;
  if (mes == 2) {
    // Verifica se é um ano bissexto
    if ((ano % 4 == 0 && ano % 100 != 0) || ano % 400 == 0) {
      diasNoMes = 29;
    } else {
      diasNoMes = 28;
    }
  } else if (mes == 4 || mes == 6 || mes == 9 || mes == 11) {
    diasNoMes = 30;
  } else {
    diasNoMes = 31;
  }

// Gera a lista de dias do mês
  List<int> dias = [];
  for (int i = 1; i <= diasNoMes; i++) {
    dias.add(i);
  }

  return dias;
}

int getDayNumber(DateTime date) {
  int month = date.day;
  return month;
}

DateTime hourDate(String hour) {
  // create a function that receive a paramater called hour (string) this paramater will come in the formato hh:mm, the function return the current date with the hour changed by the hour of the parameter
  List<String> hourSplit = hour.split(':');
  DateTime now = DateTime.now();
  DateTime newDate = DateTime(now.year, now.month, now.day,
      int.parse(hourSplit[0]), int.parse(hourSplit[1]));
  return newDate;
}

DateTime newDateCustom(
  int year,
  int month,
  int day,
) {
  // function that receive a paramater day, month and year (all int), and generate a datetime with this data
  return DateTime(year, month, day);
}

String formateToDE(DateTime date) {
  // receive a date time and return a string formatted as "d/dd" where D is the number of the day in the month and DD is the day on the weem
  String formattedDate = DateFormat('d/E').format(date);
  return formattedDate;
}

String? getDeviceData() {
  return null;
}
