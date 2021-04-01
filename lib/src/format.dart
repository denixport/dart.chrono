import 'dart:typed_data';

// format according to ISO

//const _months = "010203040506070809101112";
//const _days = "01020304050607080910111213141516171819202122232425262728293031";
//const _hours = "01020304050607080910111213141516171819202122232425262728293031";

const tpl = "00010203040506070809"
    "10111213141516171819"
    "20212223242526272829"
    "30313233343536373839"
    "40414243444546474849"
    "50515253545556575859";

var timeTpl = "00010203040506070809"
    "10111213141516171819"
    "20212223242526272829"
    "30313233343536373839"
    "40414243444546474849"
    "50515253545556575859"
    .codeUnits;

var _dateStrBuf = new Uint8List.fromList(
    <int>[0x30, 0x30, 0x30, 0x30, 0x2D, 0x30, 0x30, 0x2D, 0x30, 0x30]);

var _timeStrBuf = new Uint8List.fromList(<int>[
  0x30, 0x30, 0x3A,//
 0x30, 0x30, 0x3A, 0x30, 0x30, 0x2E, 0x30,  0x30, 0x30, 0x30,
    0x30, 0x30, 0x30, 0x30, 0x30]);

String formatYear_old(int year) {
  const _pow10 = const <int>[100000, 10000, 1000, 100, 10, 1];
  const _pad = const <String>['', '0', '00', '0', '00', '000'];

  int absYear = year.abs();

  if (absYear > 999 && absYear < 10000) return year.toString();

  String sign = (year < 0) ? '-' : '+';
  for (int i = 0; i < _pow10.length; i++) {
    if (absYear >= _pow10[i]) return '$sign${_pad[i]}$absYear';
  }

  return '0000';
}

// TODO: check
String formatYear(int year) {
  if (1000 <= year && year <= 9999) return year.toString();
  if (0 < year && year < 1000) return year.toString().padLeft(4, "0");

  int abs = year.abs();
  String sign = year < 0 ? "-" : "+";
  if (abs >= 1000) return "${sign}$abs";
  if (abs >= 100) return "${sign}0$abs";
  if (abs >= 10) return "${sign}00$abs";
  return "${sign}000$abs";
}


String formatTime(int hour, int minute, int second, int nano) {
  _timeStrBuf[0] = timeTpl[2 * hour];
  _timeStrBuf[1] = timeTpl[2 * hour + 1];
  _timeStrBuf[3] = timeTpl[2 * minute];
  _timeStrBuf[4] = timeTpl[2 * minute + 1];
  _timeStrBuf[6] = timeTpl[2 * second];
  _timeStrBuf[7] = timeTpl[2 * second + 1];

  final nc = nano.toString().codeUnits;

  for (int i = 0; i < nc.length; i++) {
    _timeStrBuf[9 + i] = nc[i];
  }

  return String.fromCharCodes(_timeStrBuf);
}

String format2Digits(int v) => tpl.substring(2 * v, 2 * v + 2);
