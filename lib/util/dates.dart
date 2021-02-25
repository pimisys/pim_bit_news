import 'dart:math';

import 'package:flutter/material.dart';

class PimDates {
  //extends DateTime
  DateTime dateTime;

  static const _daysInMonth = const [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  PimDates({@required this.dateTime});

  String toStringAAAAMMDD() =>
      dateTime.year.toString() +
      '-' +
      dateTime.month.toString().padLeft(2, '0') +
      '-' +
      dateTime.day.toString().padLeft(2, '0');

  bool isLeapYear(int value) =>
      (value % 400 == 0) || ((value % 4 == 0) && (value % 100 != 0));

  int daysInMonth(int year, int month) {
    var result = _daysInMonth[month];
    if (month == 2 && isLeapYear(year)) result++;
    return result;
  }

  void addDays(int value) {
    dateTime = dateTime.add(new Duration(days: value));
  }

  void addMonths(int value) {
    int r;
    int q;
    int newYear;
    int newMonth;

    r = value % 12;
    q = (value - r) ~/ 12;
    newYear = dateTime.year + q;
    newMonth = dateTime.month + r;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    var newDay = min(dateTime.day, daysInMonth(newYear, newMonth));
    if (dateTime.isUtc) {
      dateTime = new DateTime.utc(
          newYear,
          newMonth,
          newDay,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond);
    } else {
      dateTime = new DateTime(
          newYear,
          newMonth,
          newDay,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond);
    }
  }
}
