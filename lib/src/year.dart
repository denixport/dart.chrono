import 'format.dart';
import 'math.dart';

class Year implements Comparable<Year> {
  /// min and max supported year values
  static const int minValue = -9999;
  static const int maxValue = 9999;

  ///
  static const Year min = Year._(minValue);

  ///
  static const Year zero = Year._(0);

  ///
  static const Year max = Year._(maxValue);

  /// Ordinal value of the year
  final int value;

  ///
  static bool isValidValue(int year) {
    return (Year.minValue <= year && year <= Year.maxValue);
  }

  ///
  static int checkedValue(int year) {
    if (Year.minValue > year || year > Year.maxValue) {
      throw RangeError.range(year, Year.minValue, Year.maxValue, 'year');
    }
    return year;
  }

  const Year._(this.value);

  ///
  Year(int year) : this.value = checkedValue(year);

  ///
  bool get isLeap => isLeapYear(value);

  /// Returns number of days in this year
  int get inDays => daysInYear(value);

  /// Returns number of ISO weeks in this year
  int get inWeeks => weeksInYear(value);

  int get inMonths => 12;

  ///
  @override
  bool operator ==(Object other) => other is Year && this.value == other.value;

  @override
  int get hashCode => value.hashCode;

  // comparison ---------------------------------------------------------------

  int compareTo(Year other) => this.value - other.value;

  bool operator >(Year other) => (this.value - other.value) > 0;

  bool operator >=(Year other) => (this.value - other.value) >= 0;

  bool operator <(Year other) => (this.value - other.value) < 0;

  bool operator <=(Year other) => (this.value - other.value) <= 0;

  Year operator +(int value) =>
      new Year._((this.value + value).clamp(minValue, maxValue));

  Year operator -(int value) =>
      new Year._((this.value - value).clamp(minValue, maxValue));

  ///
  String toString() => formatYear(value);
}
