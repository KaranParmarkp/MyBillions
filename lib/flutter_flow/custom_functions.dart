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
  return (total * 100).round() / 100;
}

String doubleToStringFixed(
  int? strigFixed,
  double? value,
) {
  return value != null ? value.toStringAsFixed(strigFixed ?? 2) : "0";
}

String formateStringToDate(String? date) {
  return date != null && date != ""
      ? DateFormat('MMM dd, yyyy').format(DateTime.parse(date))
      : "";
}

DateTime dmyToDatetime(String date) {
  DateFormat format = DateFormat('dd/MM/yyyy');
  return format.parse(date);
}

DateTime stringToDateTime(String date) {
  return DateTime.parse(date);
}

List<String> getCountryCode() {
  List<String> countryCodes = [
    "+1",
    "+7",
    "+20",
    "+27",
    "+30",
    "+31",
    "+32",
    "+33",
    "+34",
    "+36",
    "+39",
    "+40",
    "+41",
    "+42",
    "+43",
    "+44",
    "+45",
    "+46",
    "+47",
    "+48",
    "+51",
    "+52",
    "+53",
    "+54",
    "+55",
    "+56",
    "+57",
    "+58",
    "+60",
    "+61",
    "+62",
    "+63",
    "+64",
    "+65",
    "+66",
    "+81",
    "+82",
    "+84",
    "+86",
    "+90",
    "+91",
    "+92",
    "+93",
    "+94",
    "+95",
    "+98",
    "+212",
    "+221",
    "+222",
    "+223",
    "+224",
    "+225",
    "+226",
    "+227",
    "+228",
    "+229",
    "+230",
    "+231",
    "+232",
    "+233",
    "+234",
    "+235",
    "+236",
    "+237",
    "+238",
    "+239",
    "+240",
    "+241",
    "+242",
    "+243",
    "+244",
    "+245",
    "+246",
    "+248",
    "+249",
    "+250",
    "+251",
    "+252",
    "+253",
    "+254",
    "+255",
    "+256",
    "+257",
    "+258",
    "+260",
    "+261",
    "+262",
    "+263",
    "+264",
    "+265",
    "+266",
    "+267",
    "+268",
    "+269",
    "+290",
    "+291",
    "+350",
    "+351",
    "+352",
    "+353",
    "+354",
    "+355",
    "+356",
    "+357",
    "+358",
    "+359",
    "+370",
    "+371",
    "+372",
    "+373",
    "+374",
    "+375",
    "+376",
    "+377",
    "+378",
    "+379",
    "+380",
    "+381",
    "+382",
    "+385",
    "+387",
    "+389",
    "+420",
    "+421",
    "+423",
    "+500",
    "+501",
    "+502",
    "+503",
    "+504",
    "+505",
    "+506",
    "+507",
    "+508",
    "+509",
    "+590",
    "+591",
    "+592",
    "+593",
    "+594",
    "+595",
    "+596",
    "+597",
    "+598",
    "+599",
    "+681",
    "+682",
    "+683",
    "+685",
    "+686",
    "+687",
    "+688",
    "+689",
    "+690",
    "+691",
    "+692",
    "+850",
    "+852",
    "+853",
    "+855",
    "+856",
    "+880",
    "+886",
    "+960",
    "+961",
    "+962",
    "+963",
    "+964",
    "+965",
    "+966",
    "+967",
    "+968",
    "+970",
    "+971",
    "+972",
    "+973",
    "+974",
    "+975",
    "+976",
    "+977",
    "+992",
    "+993",
    "+994",
    "+995",
    "+996",
    "+998"
  ];
  return countryCodes;
}

int? getCodeFromDesc(
  List<String> list,
  String desc,
) {
  int index = list.indexWhere(
    (element) => element == desc,
  );
  return index != -1 ? index : null;
}

double schemeTotalPercent(List<dynamic> jsonList) {
  double totalAmount = 0;
  for (var category in jsonList) {
    // Sum amounts from the main category if the key contains 'Amount'
    category.forEach((key, value) {
      if (key.toString().toLowerCase().contains('percent')) {
        totalAmount += value.toDouble();
      }
    });
  }
  return totalAmount;
}

int numberIncrementDecrement(
  int number,
  bool isIncrement,
  int maxIncrement,
) {
  return isIncrement
      ? (number == maxIncrement ? number : number + 1)
      : (number <= 0 ? 0 : number - 1);
}

Color checkPositiveValueColor(double value) {
  if (value > 0) {
    return Colors.green; // Return green if value is positive
  } else if (value < 0) {
    return Colors.red; // Return red if value is negative
  } else {
    return Colors.white; // Return white if value is 0
  }
}

int toDoubleRound(String amount) {
  //final formatter = NumberFormat('#,##,###');
  //return formatter.format(double.parse(amount).round());
  return double.parse(amount).round();
}

double schemeTotalAmount(List<dynamic> jsonList) {
  double totalAmount = 0;
  for (var category in jsonList) {
    // Sum amounts from the main category if the key contains 'Amount'
    category.forEach((key, value) {
      if (key.contains('Amount')) {
        totalAmount += value.toDouble();
      }
    });
  }
  return totalAmount;
}

int toInt(dynamic number) {
  return int.parse(number.toString());
}

String savePlanFunction(List<String> list) {
  if (list.length == 2) {
    return "StartingBalance:${list[0]},Lumpsum:${list[0]},MonthlyInvestment:${list[1]},YEARS:3000,Expense:0,MONTHLYTOTALCONTRIBUTION:0,TrackStatus:0,FutureValue:0,MonthlyInvestmentRequired:0";
  } else {
    return "";
  }
}

int getInvestorId(
  List<dynamic> jsonList,
  String searchString,
) {
  for (var item in jsonList) {
    if (item["Name"] != null && item["Name"].contains(searchString)) {
      return item["InvestorID"];
    }
  }
  return 0;
}

int getPlanId(
  List<dynamic> jsonList,
  String searchString,
) {
  for (var item in jsonList) {
    if (item["PlanName"] != null && item["PlanName"].contains(searchString)) {
      return item["CustomerPlanID"];
    }
  }
  return 0;
}
