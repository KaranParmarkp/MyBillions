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
import '/auth/custom_auth/auth_util.dart';

String? addSpaceString(String text) {
  return "  ${text}  ";
}

double toDouble(String amount) {
  //final formatter = NumberFormat('#,##,###');
  //return formatter.format(double.parse(amount).round());
  return double.parse(amount);
}

double sumOfDoubleList(List<double> list) {
  double total = 0;
  for (double number in list) {
    total += number;
  }
  return total;
}

String doubleToStringFixed(
  int? strigFixed,
  double? value,
) {
  return value != null ? value.toStringAsFixed(strigFixed ?? 2) : "0";
}
